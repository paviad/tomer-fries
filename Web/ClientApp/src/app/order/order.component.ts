import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { Order } from '../models/order';

@Component({
  selector: 'app-order',
  templateUrl: './order.component.html',
  styleUrls: ['./order.component.scss']
})
export class OrderComponent implements OnInit {
  @Input() order: Order;
  @Output() nextStep = new EventEmitter<void>();

  public get sizeStr(): string {
    return ['קטן', 'בינוני', 'גדול'][this.order.size];
  }

  public get crispiness(): string {
    return this.order.isCrispy ? 'קריספי' : 'רך';
  }

  public get action(): string {
    return {
      0: 'התחל הכנה',
      1: 'צא למשלוח',
      2: 'קיבלתי תשלום'
    }[this.order.trackingState];
  }

  constructor() { }

  ngOnInit(): void {
  }

}
