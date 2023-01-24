import { Component, Input, OnInit } from '@angular/core';
import { SecurityService } from '../security.service';

@Component({
  selector: 'app-authorized',
  templateUrl: './authorized.component.html',
  styleUrls: ['./authorized.component.css']
})
export class AuthorizedComponent implements OnInit {

  constructor(private securityService: SecurityService) { }

  @Input()
  role: string = ''

  ngOnInit(): void {
  }

  isAuthorized(): boolean {
    if(this.role !== ''){
      return this.securityService.getRole() === this.role
    } else {
      return this.securityService.isLoggedIn()
    }
  }

}
