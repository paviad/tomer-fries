import { Component, OnInit } from '@angular/core';
import {
  trigger,
  state,
  style,
  animate,
  transition,
} from '@angular/animations';
import { interval, Subject } from 'rxjs';

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
        // style({ height: '0', overflow: 'visible' }),
        animate('100ms 0ms ease-in', style({ transform: 'translateX(1000%)' }))
      ])
    ])
  ],
})
export class HomeComponent implements OnInit {
  orderState = 0;
  sizeSelected?: number;

  crispiness?: number;
  address: string;
  notes: string;

  trackingState = 0;

  constructor() {
    interval(1000).subscribe(r => this.trackingState = (this.trackingState + 1) % 4);
  }

  ngOnInit(): void {
  }

  clickOrder(size: number) {
    this.sizeSelected = size;
    this.orderState = 1;
  }

  clickSummary() {
    this.orderState = 2;
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
    if (!this.crispiness) {
      return false;
    }
    return true;
  }

  confirmOrder() {
    this.orderState = 3;
  }
}
