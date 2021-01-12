import { AfterViewInit, Component, OnDestroy, OnInit, ViewChild } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { User } from 'oidc-client';
import { EMPTY, Observable, Subject, Subscription } from 'rxjs';
import { catchError, distinctUntilChanged, filter, ignoreElements, map, switchMap, tap, withLatestFrom } from 'rxjs/operators';
import { AuthService } from '../auth.service';
import { JexcelDirective } from '../jexcel.directive';
import { AppUser } from '../models/app-user';
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
  otherUsers$: Observable<AppUser[]>;
  userId: string;
  loadedData: string;

  constructor(
    authSvc: AuthService,
    private route: ActivatedRoute,
    private securedSvc: SecuredService) {
    this.user$ = authSvc.user$;
  }

  ngOnInit(): void {

    const userId$ = this.route.paramMap.pipe(
      withLatestFrom(this.user$),
      filter(([_, user]) => !!user),
      map(([r, _]) => r),
      map(r => r.get('userId')),
      tap(r => this.userId = r)
    );

    const saveExcelData$ = this.newData$.pipe(
      withLatestFrom(userId$),
      tap(r => this.saving = true),
      switchMap(([r, userId]) => this.securedSvc.setData(r, null, userId)),
      tap(r => this.saving = false));

    const adminData$ = this.user$.pipe(
      filter(r => !!r),
      map(r => !!r.profile /*&& r.profile.admin === 'True'*/), // everyone's an admin for now
      distinctUntilChanged(),
      switchMap(r => this.securedSvc.getUsers())
    );

    const getExcelData$ = userId$.pipe(
      tap(r => {
        this.loading = true;
        this.loaded = false;
      }),
      switchMap(userId => this.securedSvc.getData(null, userId).pipe(
        tap(r => {
          this.loading = false;
          this.loaded = true;
          setTimeout(() => this.theSheet.setData(r), 0);
        }),
        catchError(err => {
          this.loading = false;
          this.loaded = false;
          return EMPTY;
        })
      )),
    );

    this.otherUsers$ = adminData$;

    this.subs.push(
      saveExcelData$.subscribe(),
      // adminData$.subscribe(), // no need to subscribe here, the template uses it with the |async pipe
      getExcelData$.subscribe()
    );
  }

  ngOnDestroy(): void {
    this.subs.forEach(x => x.unsubscribe());
  }

  ngAfterViewInit(): void {
    if (this.loadedData) {
      this.theSheet.setData(this.loadedData);
    }
  }

  setLoadedData(json: string) {
    this.loadedData = json;
    if (this.theSheet) {
      this.theSheet.setData(json);
    }
  }

  excelChange(json: string) {
    this.newData$.next(json);
  }
}
