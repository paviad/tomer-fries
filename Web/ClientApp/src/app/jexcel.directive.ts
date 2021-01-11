import { isPlatformServer } from '@angular/common';
import { AfterViewInit, Directive, ElementRef, EventEmitter, HostListener, Inject, Output, PLATFORM_ID } from '@angular/core';

declare var jexcel: any;

@Directive({
  selector: '[appExcel]',
  exportAs: 'excel',
})
export class JexcelDirective implements AfterViewInit {
  jsheet: any;

  @Output() appExcel = new EventEmitter<string>();

  constructor(
    @Inject(PLATFORM_ID) private platformId,
    private el: ElementRef) {
    console.log('global jexcel', jexcel);
  }

  ngAfterViewInit(): void {
    if (isPlatformServer(this.platformId)) {
      return;
    }
    console.log('el', this.el);
    this.initJexcel();
    this.jsheet.onafterchanges = (e, r) => this.onChange(e, r);
  }

  private initJexcel() {
    this.jsheet = jexcel(this.el.nativeElement, {
      minDimensions: [20, 25],
    });

    console.log('jsheet', this.jsheet);
  }

  onChange(e, r) {
    const json = this.jsheet.getJson();
    this.appExcel.emit(json);
  }

  public setData(data) {
    if (isPlatformServer(this.platformId)) {
      return;
    }
    this.jsheet.setData(JSON.parse(data));
  }
}
