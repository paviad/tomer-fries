import { Injectable } from '@angular/core';
import * as signalR from '@microsoft/signalr';
import { Observable, Subject } from 'rxjs';
import { AuthService } from './auth.service';
import { Order } from './models/order';

@Injectable({
  providedIn: 'root'
})
export class OrderNotificationService {
  private accessToken: string;

  private pOrderTracking = new Subject<Order>();
  orderTracking$: Observable<Order> = this.pOrderTracking.asObservable();

  private pOrderReset = new Subject<string>();
  orderReset$: Observable<string> = this.pOrderReset.asObservable();

  private pOrderUpdate = new Subject<Order>();
  orderUpdate$: Observable<Order> = this.pOrderUpdate.asObservable();

  private connection: signalR.HubConnection;

  constructor(private auth: AuthService) {
    this.auth.getAccessToken().subscribe(r => this.accessToken = r);
    this.auth.getUser().subscribe(r => this.reconnect());
  }

  private reconnect() {
    if (this.connection) {
      this.connection.stop();
    }

    const connection = new signalR.HubConnectionBuilder()
      .withUrl(`/api/ws`, { accessTokenFactory: () => this.accessToken })
      .configureLogging(signalR.LogLevel.Information)
      .build();

    connection.start()
      .then(() => {
        console.log('connections started');
      })
      .catch(err => console.log('error', err));

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
