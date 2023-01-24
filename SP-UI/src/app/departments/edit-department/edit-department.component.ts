import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Category } from 'src/app/models/category';
import { Department } from 'src/app/models/department';
import { SecurityService } from 'src/app/security/security.service';
import { parseAPIErrors } from 'src/app/utilities/utilities';
import { DepartmentsService } from '../departments.service';

@Component({
  selector: 'app-edit-department',
  templateUrl: './edit-department.component.html',
  styleUrls: ['./edit-department.component.css']
})
export class EditDepartmentComponent implements OnInit {

  constructor(
    private departmentsService: DepartmentsService,
    private activatedRoute: ActivatedRoute,
    private router: Router,
    private securityService: SecurityService) { }

  departmentToEdit: Department = {id: 0, name: '', description: ''}

  errors: string[] = []

  ngOnInit(): void {
    if(this.securityService.isLoggedIn()) {
      this.activatedRoute.params.subscribe(params => {
        this.departmentsService.getById(params['id'])
        .subscribe({
          next: department => {this.departmentToEdit = department}
        })
      })
    } else {
      this.router.navigate(["/login"])
    }
  }

  saveChanges(department: Department){
    if(this.securityService.isLoggedIn()) {
      this.departmentsService.edit(this.departmentToEdit.id, department)
      .subscribe({
        next: () => {this.router.navigate(['/departments'])},
        error: errors => this.errors = parseAPIErrors(errors)
      })
    } else {
      this.router.navigate(["/login"])
    }
  }
}
