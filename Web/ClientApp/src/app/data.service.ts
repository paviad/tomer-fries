import { isPlatformServer } from '@angular/common';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Inject, Injectable, PLATFORM_ID } from '@angular/core';
import { Observable, of } from 'rxjs';
import { BackendState } from './backend-state';
import { Order } from './models/order';

@Injectable({
  providedIn: 'root'
})
export class DataService {
  defaultOrder: Order = {
    address: 'lala',
    dateCreated: new Date(),
    id: '00000000-0000-0000-0000-000000000000',
    isCrispy: true,
    notes: 'fsfdds',
    phone: 'dfgsfg',
    size: 0,
    state: 0,
    trackingState: 0,
    userId: '00000000-0000-0000-0000-000000000000',
  };

  constructor(private http: HttpClient, private backendState: BackendState, @Inject(PLATFORM_ID) private platformId) { }

  url(api: string) {
    return `${this.backendState.deployment.api}Orders/${api}`;
  }

  r<T>(def: T, obs: Observable<T>) {
    if (isPlatformServer(this.platformId)) {
      return of(def);
    }
    return obs;
  }

  newOrder(): Observable<Order> {
    return this.r(this.defaultOrder, this.http.get<Order>(this.url('NewOrder')));
  }

  getAllOrders(): Observable<Order[]> {
    return this.r([], this.http.get<Order[]>(this.url('GetAllOrders')));
  }

  setSize(size: number): Observable<Order> {
    const params = new HttpParams().set('size', size.toString());
    return this.r(this.defaultOrder, this.http.post<Order>(this.url('SetSize'), {}, { params }));
  }

  setData(crispiness: number, address: string, phoneNumber: string, notes: string): Observable<Order> {
    const rc = this.http.post<Order>(this.url('SetData'), {
      crispiness,
      address,
      phoneNumber,
      notes,
    });

    return this.r(this.defaultOrder, rc);
  }

  getOrder(id?: string): Observable<Order> {
    let params = new HttpParams();
    if (id) {
      params = params.set('id', id.toString());
    }
    return this.r(this.defaultOrder, this.http.get<Order>(this.url('GetOrder'), { params }));
  }

  confirmOrder(): Observable<Order> {
    return this.r(this.defaultOrder, this.http.post<Order>(this.url('ConfirmOrder'), {}));
  }

  resetOrder(): Observable<void> {
    return this.r(null, this.http.post<void>(this.url('ResetOrder'), {}));
  }

  startPreparing(id: string) {
    const params = new HttpParams().set('id', id);
    return this.r(null, this.http.post<void>(this.url('StartPreparing'), {}, { params }));
  }

  startDelivery(id: string) {
    const params = new HttpParams().set('id', id);
    return this.r(null, this.http.post<void>(this.url('StartDelivery'), {}, { params }));
  }

  paymentReceived(id: string) {
    const params = new HttpParams().set('id', id);
    return this.r(null, this.http.post<void>(this.url('PaymentReceived'), {}, { params }));
  }

  cancelOrder(id: string) {
    const params = new HttpParams().set('id', id);
    return this.r(null, this.http.post<void>(this.url('CancelOrder'), {}, { params }));
  }
}
