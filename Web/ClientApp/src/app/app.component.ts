import { Component } from '@angular/core';
import { OrderNotificationService } from './order-notification.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'ClientApp';

  constructor(private notif: OrderNotificationService) { }
}
