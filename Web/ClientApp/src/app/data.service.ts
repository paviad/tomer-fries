import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Order } from './models/order';

@Injectable({
  providedIn: 'root'
})
export class DataService {

  constructor(private http: HttpClient) { }

  url(api: string) {
    return `/api/Orders/${api}`;
  }

  newOrder(): Observable<Order> {
    return this.http.get<Order>(this.url('NewOrder'));
  }

  getAllOrders(): Observable<Order[]> {
    return this.http.get<Order[]>(this.url('GetAllOrders'));
  }

  setSize(size: number): Observable<Order> {
    const params = new HttpParams().set('size', size.toString());
    return this.http.post<Order>(this.url('SetSize'), {}, { params });
  }

  setData(crispiness: number, address: string, phoneNumber: string, notes: string): Observable<Order> {
    return this.http.post<Order>(this.url('SetData'), {
      crispiness,
      address,
      phoneNumber,
      notes,
    });
  }

  getOrder(id?: string): Observable<Order> {
    let params = new HttpParams();
    if (id) {
      params = params.set('id', id.toString());
    }
    return this.http.get<Order>(this.url('GetOrder'), { params });
  }

  confirmOrder(): Observable<Order> {
    return this.http.post<Order>(this.url('ConfirmOrder'), {});
  }

  resetOrder(): Observable<void> {
    return this.http.post<void>(this.url('ResetOrder'), {});
  }

  startPreparing(id: string) {
    const params = new HttpParams().set('id', id);
    return this.http.post<void>(this.url('StartPreparing'), {}, { params });
  }

  startDelivery(id: string) {
    const params = new HttpParams().set('id', id);
    return this.http.post<void>(this.url('StartDelivery'), {}, { params });
  }

  paymentReceived(id: string) {
    const params = new HttpParams().set('id', id);
    return this.http.post<void>(this.url('PaymentReceived'), {}, { params });
  }

  cancelOrder(id: string) {
    const params = new HttpParams().set('id', id);
    return this.http.post<void>(this.url('CancelOrder'), {}, { params });
  }
}
