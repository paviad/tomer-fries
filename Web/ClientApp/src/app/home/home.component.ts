import { AfterViewInit, Component, OnDestroy, OnInit, ViewChild } from '@angular/core';
import { User } from 'oidc-client';
import { Observable, Subject, Subscription } from 'rxjs';
import { distinctUntilChanged, map, switchMap, tap } from 'rxjs/operators';
import { AuthService } from '../auth.service';
import { JexcelDirective } from '../jexcel.directive';
import { SecuredService } from '../secured.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit, OnDestroy, AfterViewInit {
  @ViewChild('theSheet') theSheet: JexcelDirective;

  securedData: string;
  newData$ = new Subject<string>();
  subs: Subscription[] = [];
  saving = false;
  loading = true;
  loaded = false;
  user$: Observable<User>
  otherUsers$: Observable<string[]>;

  constructor(
    private authSvc: AuthService,
    private securedSvc: SecuredService) {
    this.user$ = authSvc.user$;
  }

  ngOnInit(): void {
    this.subs.push(
      this.newData$.pipe(
        tap(r => this.saving = true),
        switchMap(r => this.securedSvc.setData(r)),
        tap(r => this.saving = false)
      ).subscribe()
    );

    this.subs.push(
      this.user$.pipe(
        map(r => r.profile && r.profile.admin === 'True'),
        distinctUntilChanged(),
      ).subscribe(r => this.getAdminData())
    )
  }

  ngOnDestroy(): void {
    this.subs.forEach(x => x.unsubscribe());
  }

  ngAfterViewInit(): void {
    this.securedSvc.getData().subscribe({
      next: r => {
        this.loading = false;
        this.loaded = true;
        setTimeout(() => this.theSheet.setData(r), 0);
      },
      error: err => {
        this.loading = false;
        this.loaded = false;
      }
    });
  }

  getAdminData() {
    this.otherUsers$ = this.securedSvc.getUsers();
  }

  getSecuredData() {
    this.securedSvc.getData().subscribe(
      {
        next: r => this.securedData = r,
        error: r => this.securedData = 'error',
      }
    );
  }

  excelChange(json: string) {
    this.newData$.next(json);
  }
}
