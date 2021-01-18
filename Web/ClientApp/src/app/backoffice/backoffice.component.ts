import { Component, OnInit } from '@angular/core';
import { combineLatest, Observable } from 'rxjs';
import { map, startWith, withLatestFrom } from 'rxjs/operators';
import { AuthService } from '../auth.service';
import { DataService } from '../data.service';
import { Order } from '../models/order';
import { OrderNotificationService } from '../order-notification.service';

@Component({
  selector: 'app-backoffice',
  templateUrl: './backoffice.component.html',
  styleUrls: ['./backoffice.component.scss']
})
export class BackofficeComponent implements OnInit {
  orders$: Observable<Order[]>;

  constructor(
    private svc: DataService,
    private notif: OrderNotificationService,
    private auth: AuthService) { }

  ngOnInit(): void {

    this.orders$ = combineLatest([this.notif.orderTracking$.pipe(startWith({ id: null } as Order)), this.svc.getAllOrders()]).pipe(
      map(([order, orders]) => {
        const omap = orders.reduce((acc, v) => Object.assign(acc, { [v.id]: v }), {});
        if (!order.id) {
          return orders;
        }

        if (order.trackingState >= 3) {
          delete omap[order.id];
        } else {
          omap[order.id] = order;
        }
        return Object.values(omap);
      })
    );
  }

  login() {
    this.auth.loginGoogle();
  }

  logout() {
    this.auth.logout();
  }

  doAction(order: Order) {
    switch (order.trackingState) {
      case 0:
        this.svc.startPreparing(order.id).subscribe();
        break;
      case 1:
        this.svc.startDelivery(order.id).subscribe();
        break;
      case 2:
        this.svc.paymentReceived(order.id).subscribe();
        break;
    }
  }
}
