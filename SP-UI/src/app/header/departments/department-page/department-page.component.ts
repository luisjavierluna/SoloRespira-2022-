import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { DepartmentsService } from 'src/app/departments/departments.service';
import { PageDepartment } from 'src/app/models/department';
import { parseAPIErrors } from 'src/app/utilities/utilities';

@Component({
  selector: 'app-department-page',
  templateUrl: './department-page.component.html',
  styleUrls: ['./department-page.component.css']
})
export class DepartmentPageComponent implements OnInit {

  constructor(
    private departmentService: DepartmentsService,
    private activatedRoute: ActivatedRoute,
    private router: Router) { }

  departmentPage: PageDepartment = {
    id: 0,
    name: '',
    description: '',
    categories: []
  }

  errors: string[] = []

  ngOnInit(): void {
    this.activatedRoute.params.subscribe(params => {
      this.departmentService.getByPageName(params['name'])
      .subscribe({
        next: departmentResponse => {
          this.departmentPage = departmentResponse
        },
        error: errors => {this.errors = parseAPIErrors(errors)}
      })
    })
  }


  goToSearch(id: number) {
    this.router.navigate(['/search'], {queryParams:{
      departmentId:this.departmentPage.id,
      categoryId:id}})
  }

}
