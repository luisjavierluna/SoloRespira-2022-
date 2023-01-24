import { Component, OnInit } from '@angular/core';
import { AppComponent } from 'src/app/app.component';
import { DepartmentsService } from 'src/app/departments/departments.service';
import { MenuDepartment } from 'src/app/models/department';

@Component({
  selector: 'app-navbar-menus',
  templateUrl: './navbar-menus.component.html',
  styleUrls: ['./navbar-menus.component.css']
})
export class NavbarMenusComponent implements OnInit {

  constructor(
    private departmentsService:DepartmentsService) { }

  headerMenuDepartments: MenuDepartment[] = []

  navbarLinksVariable = false

  ngOnInit(): void {
    this.departmentsService.getAllMenuDepartments()
    .subscribe({
      next: menuDepartments => {
        this.headerMenuDepartments = menuDepartments
      }
    })
  }

  showNavbarLinksUl(){
    this.navbarLinksVariable = !this.navbarLinksVariable
  }
}
