import { isPlatformServer } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { Inject, Injectable, PLATFORM_ID } from '@angular/core';
import { EMPTY, Observable, of } from 'rxjs';
import { BackendState } from './backend-state';

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

  getData(): Observable<string> {
    if (isPlatformServer(this.platformId)) {
      return of(null);
    }

    return this.http.get(this.url('GetData'), { responseType: 'text' });
  }

  setData(json: string): Observable<void> {
    if (isPlatformServer(this.platformId)) {
      return EMPTY;
    }

    const body = {
      data: JSON.stringify(json),
    };
    return this.http.post<void>(this.url('SetData'), body);
  }

  getUsers(): Observable<string[]> {
    return this.http.get<string[]>(this.url('GetUsers'));
  }
}

