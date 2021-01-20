import { Component, OnDestroy, OnInit } from '@angular/core';
import {
  trigger,
  state,
  style,
  animate,
  transition,
} from '@angular/animations';
import { DataService } from '../data.service';
import { AuthService } from '../auth.service';
import { ActivatedRoute, Router } from '@angular/router';
import { withLatestFrom } from 'rxjs/operators';
import { OrderNotificationService } from '../order-notification.service';
import { Order } from '../models/order';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss'],
  animations: [
    trigger('parent', [
      transition(':enter', [])
    ]),
    trigger('flyInOut', [
      state('in', style({ transform: 'translateX(0)' })),
      transition(':enter', [
        style({ transform: 'translateX(-200%)' }),
        animate('200ms 0ms ease-out')
      ]),
      transition(':leave', [
        animate('100ms 0ms ease-in', style({ transform: 'translateX(1000%)' }))
      ])
    ])
  ],
})
export class HomeComponent implements OnInit, OnDestroy {
  orderState?: number;
  sizeSelected?: number;

  crispiness?: number;
  address: string;
  phoneNumber: string;
  notes: string;

  trackingState = 0;
  track: boolean;
  orderId: string;

  subs: Subscription[] = [];

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private notif: OrderNotificationService,
    private auth: AuthService,
    private svc: DataService) {
  }

  ngOnInit(): void {
    const s1 = this.route.data.pipe(
      withLatestFrom(this.route.paramMap)
    )
      .subscribe(([data, paramMap]) => {
        let orderId: string | null = null;
        console.log('track', data, paramMap.has('id'));
        this.track = !!data.track;
        if (data.track && paramMap.has('id')) {
          orderId = paramMap.get('id');
          this.orderId = orderId;
        }
        this.getOrderData(orderId);
      });

    const s2 = this.notif.orderTracking$.subscribe(r => {
      if (!this.orderId || r.id !== this.orderId) {
        return;
      }
      this.trackingState = r.trackingState;
    });

    const s3 = this.notif.orderReset$.subscribe(r => {
      if (!this.orderId || r !== this.orderId) {
        return;
      }
      if (this.track) {
        alert('הזמנתך בוטלה ע"י תומר!');
      }
      this.getOrderData();
    });

    const s4 = this.notif.orderUpdate$.subscribe(r => {
      if (!this.orderId || r.id !== this.orderId) {
        return;
      }
      this.updateOrderData(r);
    });

    this.subs.push(s1, s2, s3, s4);
  }

  ngOnDestroy() {
    this.subs.forEach(x => x.unsubscribe());
  }

  private getOrderData(orderId?: string) {
    console.log('getting data', orderId);
    this.svc.getOrder(orderId).subscribe(r => {
      console.log('got data', r);
      if (!r) {
        this.router.navigate(['/home']);
      } else {
        this.updateOrderData(r);
      }
    });
  }

  private updateOrderData(r: Order) {
    this.orderId = r.id;
    this.orderState = r.state;
    this.address = r.address;
    this.phoneNumber = r.phone;
    if (typeof (r.isCrispy) === 'boolean') {
      this.crispiness = r.isCrispy ? 1 : 2;
    }
    this.notes = r.notes;
    this.sizeSelected = r.size;
    this.trackingState = r.trackingState;

    if (r.state === 3) {
      this.router.navigate(['/track', { id: r.id }]);
    }
  }

  clickOrder(size: number) {
    this.sizeSelected = size;
    this.orderState = 1;
    this.svc.setSize(size).subscribe();
  }

  clickSummary() {
    this.orderState = 2;
    this.svc.setData(this.crispiness, this.address, this.phoneNumber, this.notes).subscribe();
  }

  getSize() {
    return ['קטן', 'בינוני', 'גדול'][this.sizeSelected];
  }

  getPrice() {
    const prices = {
      0: 5,
      1: 10,
      2: 15,
    };

    return prices[this.sizeSelected];
  }

  getCrispiness() {
    return {
      1: 'קריספי',
      2: 'רך',
    }
    [this.crispiness];
  }

  isStep1Valid() {
    if (!this.address) {
      return false;
    }
    if (!this.phoneNumber) {
      return false;
    }
    if (!this.crispiness) {
      return false;
    }
    return true;
  }

  confirmOrder() {
    this.svc.confirmOrder().subscribe(r => {
      this.router.navigate(['/track', { id: r.id }]);
    });
  }

  resetOrder() {
    this.svc.resetOrder().subscribe(r => {
      if (this.track) {
        this.router.navigate(['/home']);
      } else {
        this.getOrderData();
      }
    });
  }
}
