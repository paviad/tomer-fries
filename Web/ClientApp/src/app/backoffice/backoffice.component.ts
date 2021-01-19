import { Component, OnInit } from '@angular/core';
import { combineLatest, merge, Observable } from 'rxjs';
import { map, mergeAll, scan, startWith, switchMap, withLatestFrom } from 'rxjs/operators';
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

    const m1 = this.notif.orderTracking$.pipe(map(r => ['update', r] as const));
    const m2 = this.notif.orderReset$.pipe(map(r => ['reset', r] as const));
    const m = merge(m1, m2);

    this.orders$ = this.svc.getAllOrders().pipe(
      switchMap(r => m.pipe(
        scan((acc, v) => this.combineMap(acc, v), r),
        startWith(r),
      ))
    );
  }

  combineMap(orders: Order[], op: readonly ['update', Order] | readonly ['reset', string]) {
    const omap = orders.reduce((acc, v) => Object.assign(acc, { [v.id]: v }), {});
    if (op[0] === 'reset') {
      delete omap[op[1]];
    } else {
      const order = op[1];
      if (order.trackingState >= 3) {
        delete omap[order.id];
      } else {
        omap[order.id] = order;
      }
    }
    return Object.values(omap) as Order[];
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

  cancelOrder(order: Order) {
    if (!confirm('אתה בטוח שאתה רוצה לבטל את ההזמנה?')) {
      return;
    }
    this.svc.cancelOrder(order.id).subscribe();
  }
}
