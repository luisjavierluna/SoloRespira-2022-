import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Department } from 'src/app/models/department';
import { SecurityService } from 'src/app/security/security.service';
import { DepartmentsService } from '../departments.service';

@Component({
  selector: 'app-departments',
  templateUrl: './departments.component.html',
  styleUrls: ['./departments.component.css']
})
export class DepartmentsComponent implements OnInit {

  constructor(
    private departmentsService: DepartmentsService,
    private securityService: SecurityService,
    private router: Router) { }

  departments: Department[] = []

  ngOnInit(): void {
    if(this.securityService.isLoggedIn()) {
      this.getAll()
    }else{
      this.router.navigate(['/login'])
    }
  }

  getAll(){
    this.departmentsService.getAll()
    .subscribe({
      next: departments => {this.departments = departments},
      error: error => {console.log(error)}
    })
  }

  delete(id: number){
    if(this.securityService.isLoggedIn()) {
      this.departmentsService.delete(id)
      .subscribe({
        next: () => {this.reloadCurrentPage()}
      })
    }else{
      this.router.navigate(['/login'])
    }
  }

  reloadCurrentPage(){
    window.location.reload()
  }
}
