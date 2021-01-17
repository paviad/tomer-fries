import { Component, OnInit } from '@angular/core';
import {
  trigger,
  state,
  style,
  animate,
  transition,
} from '@angular/animations';
import { interval, Subject } from 'rxjs';
import { DataService } from '../data.service';
import { AuthService } from '../auth.service';
import { ActivatedRoute, Router } from '@angular/router';
import { withLatestFrom } from 'rxjs/operators';

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
export class HomeComponent implements OnInit {
  orderState?: number;
  sizeSelected?: number;

  crispiness?: number;
  address: string;
  phoneNumber: string;
  notes: string;

  trackingState = 0;
  track: boolean;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private auth: AuthService,
    private svc: DataService) {
    // interval(1000).subscribe(r => this.trackingState = (this.trackingState + 1) % 4);
  }

  ngOnInit(): void {
    this.route.data.pipe(
      withLatestFrom(this.route.paramMap)
    )
      .subscribe(([data, paramMap]) => {
        let orderId: string | null = null;
        console.log('track', data, paramMap.has('id'));
        this.track = !!data.track;
        if (data.track && paramMap.has('id')) {
          orderId = paramMap.get('id');
        }
        this.getOrderData(orderId);
      });
  }

  private getOrderData(orderId?: string) {
    this.svc.getOrder(orderId).subscribe(r => {
      this.orderState = r.state;
      this.address = r.address;
      this.phoneNumber = r.phone;
      this.crispiness = r.isCrispy ? 1 : 2;
      this.notes = r.notes;
      this.sizeSelected = r.size;
      this.trackingState = r.trackingState;
    });
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
    this.orderState = 3;
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
