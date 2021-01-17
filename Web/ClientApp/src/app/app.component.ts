import { Component } from '@angular/core';
import { AuthService } from './auth.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'ClientApp';

  constructor(private auth: AuthService) { }

  login() {
    this.auth.loginGoogle();
  }

  logout() {
    this.auth.logout();
  }
}
