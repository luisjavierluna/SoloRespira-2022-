import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Category } from 'src/app/models/category';
import { SecurityService } from 'src/app/security/security.service';
import { CategoriesService } from '../categories.service';

@Component({
  selector: 'app-categories',
  templateUrl: './categories.component.html',
  styleUrls: ['./categories.component.css']
})
export class CategoriesComponent implements OnInit {

  constructor(
    private categoriesService: CategoriesService,
    private securityService: SecurityService,
    private router: Router) { }

  categories: Category[] = []

  ngOnInit(): void {
    if(this.securityService.isLoggedIn()) {
      this.getAll()
    }else{
      this.router.navigate(['/login'])
    }
  }

  getAll(){
    this.categoriesService.getAll()
    .subscribe({
      next: categories => {this.categories = categories},
      error: error => {console.log(error)}
    })
  }

  delete(id: number){
    if(this.securityService.isLoggedIn()) {
      this.categoriesService.delete(id)
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
