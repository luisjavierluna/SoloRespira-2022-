import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Department } from 'src/app/models/department';
import { SecurityService } from 'src/app/security/security.service';
import { parseAPIErrors } from 'src/app/utilities/utilities';
import { DepartmentsService } from '../departments.service';

@Component({
  selector: 'app-create-department',
  templateUrl: './create-department.component.html',
  styleUrls: ['./create-department.component.css']
})
export class CreateDepartmentComponent implements OnInit {

  constructor(
    private departmentsService: DepartmentsService,
    private router: Router,
    private securityService: SecurityService) { }

  errors: string[] = []

  ngOnInit(): void {
  }

  saveChanges(department: Department){
    if(this.securityService.isLoggedIn()){
      this.departmentsService.add(department)
      .subscribe({
        next: () => {this.router.navigate(['/departments'])},
        error: errors => this.errors = parseAPIErrors(errors)
      })
    } else {
      this.router.navigate(["/login"])
    }
  }

}
