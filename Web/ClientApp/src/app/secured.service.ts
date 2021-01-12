import { isPlatformServer } from '@angular/common';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Inject, Injectable, PLATFORM_ID } from '@angular/core';
import { EMPTY, Observable, of } from 'rxjs';
import { BackendState } from './backend-state';
import { AppUser } from './models/app-user';

@Injectable({
  providedIn: 'root'
})
export class SecuredService {
  constructor(
    @Inject(PLATFORM_ID) private platformId,
    private backendState: BackendState,
    private http: HttpClient) { }

  private url(api: string) {
    return `${this.backendState.deployment.api}secured/${api}`;
  }

  getData(key?: string, userId?: string): Observable<string> {
    if (isPlatformServer(this.platformId)) {
      return of(null);
    }

    let params = new HttpParams();
    if (key) {
      params = params.set('key', key);
    }
    if (userId) {
      params = params.set('userId', userId);
    }

    return this.http.get(this.url('GetData'), { params, responseType: 'text' });
  }

  setData(json: string, key?: string, userId?: string): Observable<void> {
    if (isPlatformServer(this.platformId)) {
      return EMPTY;
    }

    const body = {
      userId,
      key,
      data: JSON.stringify(json),
    };
    return this.http.post<void>(this.url('SetData'), body);
  }

  getUsers(): Observable<AppUser[]> {
    return this.http.get<AppUser[]>(this.url('GetUsers'));
  }
}

