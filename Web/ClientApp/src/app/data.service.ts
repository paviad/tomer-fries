import { HttpClient } from '@angular/common/http';
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
    return this.http.post<Order>(this.url('NewOrder'), {});
  }

  getAllOrders(): Observable<Order[]>{
    return this.http.post<Order[]>(this.url('GetAllOrders'), {});
  }
}
