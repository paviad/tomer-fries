import { BrowserModule, BrowserTransferStateModule, TransferState } from '@angular/platform-browser';
import { Inject, NgModule, Optional } from '@angular/core';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HomeComponent } from './home/home.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { FormsModule } from '@angular/forms';

import { MatInputModule } from '@angular/material/input';
import { MatButtonModule } from '@angular/material/button';
import { MatRadioModule } from '@angular/material/radio';
import { MatCardModule } from '@angular/material/card';


import { BackendState, BACKEND_STATE, BACKEND_STATE_KEY, DefaultBackendState } from './backend-state';
import { AuthInterceptorService } from './auth-interceptor.service';
import { CallbackComponent } from './callback/callback.component';
import { BackofficeComponent } from './backoffice/backoffice.component';
import { OrderComponent } from './order/order.component';

let currentBackendState: BackendState;

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    CallbackComponent,
    BackofficeComponent,
    OrderComponent
  ],
  imports: [
    BrowserModule.withServerTransition({ appId: 'serverApp' }),
    BrowserTransferStateModule,
    HttpClientModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    FormsModule,
    MatInputModule,
    MatButtonModule,
    MatRadioModule,
    MatCardModule,
  ],
  providers: [
    { provide: HTTP_INTERCEPTORS, useClass: AuthInterceptorService, multi: true },
    { provide: BackendState, useFactory: () => currentBackendState }
  ],
  bootstrap: [AppComponent]
})
export class AppModule {
  constructor(
    ssrState: TransferState,
    @Optional() @Inject(BACKEND_STATE) providedBackendState: BackendState,
  ) {
    currentBackendState = ssrState.get(BACKEND_STATE_KEY, providedBackendState || DefaultBackendState);
    console.log('app.module currentBackendState', currentBackendState);
  }
}
