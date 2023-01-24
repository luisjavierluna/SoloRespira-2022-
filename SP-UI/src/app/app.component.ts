import { Component } from '@angular/core';
import { NavbarMenusComponent } from './header/navbar-menus/navbar-menus.component';
import { SecurityService } from './security/security.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})

export class AppComponent {
  title = 'Mall-UI';

  constructor (public securityService: SecurityService) { }

  currentYear: number = new Date().getFullYear()
  searchBoxVariable = false

  showSearchBox(){
    this.searchBoxVariable = !this.searchBoxVariable
  }


  
}
