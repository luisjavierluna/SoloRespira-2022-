import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Category, CategoryCreationDTO } from 'src/app/models/category';
import { Product } from 'src/app/models/product';
import { SecurityService } from 'src/app/security/security.service';
import { parseAPIErrors } from 'src/app/utilities/utilities';
import { CategoriesService } from '../categories.service';

@Component({
  selector: 'app-edit-category',
  templateUrl: './edit-category.component.html',
  styleUrls: ['./edit-category.component.css']
})
export class EditCategoryComponent implements OnInit {

  constructor(
    private categoriesService: CategoriesService,
    private activatedRoute: ActivatedRoute,
    private router: Router,
    private securityService: SecurityService) { }

  categoryToEdit: Category = {id: 0, name: '', image: '', departmentId: 0, departmentName: ''}
  
  errors: string[] = []

  ngOnInit(): void {
    if (this.securityService.isLoggedIn()) {
      this.activatedRoute.params.subscribe(params => {
        this.categoriesService.getById(params['id'])
          .subscribe({
            next: category => { this.categoryToEdit = category },
            error: error => { console.log(error) }
          })
      })
    } else {
      this.router.navigate(["/login"])
    }
  }

  saveChanges(category: CategoryCreationDTO){
    if(this.securityService.isLoggedIn()){
      this.categoriesService.edit(this.categoryToEdit.id, category)
      .subscribe({
        next: () => {this.router.navigate(['/categories'])},
        error: errors => this.errors = parseAPIErrors(errors)
      })
    } else {
      this.router.navigate(["/login"])
    }
  }

}
