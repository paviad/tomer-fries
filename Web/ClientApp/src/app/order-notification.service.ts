import { Injectable } from '@angular/core';
import * as signalR from '@microsoft/signalr';
import { Observable, Subject } from 'rxjs';
import { distinctUntilChanged } from 'rxjs/operators';
import { AuthService } from './auth.service';
import { Order } from './models/order';

@Injectable({
  providedIn: 'root'
})
export class OrderNotificationService {
  private accessToken: string;

  private pReconnect = new Subject<void>();

  private pOrderTracking = new Subject<Order>();
  orderTracking$: Observable<Order> = this.pOrderTracking.asObservable();

  private pOrderReset = new Subject<string>();
  orderReset$: Observable<string> = this.pOrderReset.asObservable();

  private pOrderUpdate = new Subject<Order>();
  orderUpdate$: Observable<Order> = this.pOrderUpdate.asObservable();

  private connection: signalR.HubConnection;

  constructor(private auth: AuthService) {
    this.auth.getAccessToken()
      .pipe(distinctUntilChanged())
      .subscribe(r => {
        console.log('new access token', r);
        this.accessToken = r;
        this.reconnect();
      });
    // this.auth.user$.subscribe(r => this.reconnect());
    this.pReconnect.subscribe(async () => await this.reconnectInternal());
  }

  private reconnect() {
    this.pReconnect.next();
  }

  private async reconnectInternal() {
    console.log('reconnecting');
    if (this.connection) {
      await this.connection.stop();
    }

    const connection = new signalR.HubConnectionBuilder()
      .withUrl(`/api/ws`, { accessTokenFactory: () => this.accessToken })
      .configureLogging(signalR.LogLevel.Information)
      .build();

    try {

      await connection.start();
      console.log('connections started');
    }
    catch (err) {
      console.log('error', err);
    }

    connection.on('updateOrder', order => {
      console.log('updateOrder', order);
      this.pOrderUpdate.next(order);
    });

    connection.on('updateOrderTracking', order => {
      console.log('updateOrderTracking', order);
      this.pOrderTracking.next(order);
    });

    connection.on('resetOrder', order => {
      console.log('resetOrder', order);
      this.pOrderReset.next(order);
    });

    this.connection = connection;
  }
}
