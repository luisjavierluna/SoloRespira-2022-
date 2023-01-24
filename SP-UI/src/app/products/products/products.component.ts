import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Product } from 'src/app/models/product';
import { SecurityService } from 'src/app/security/security.service';
import { ProductsService } from '../products.service';


@Component({
  selector: 'app-products',
  templateUrl: './products.component.html',
  styleUrls: ['./products.component.css']
})
export class ProductsComponent implements OnInit {

  constructor(
    private productsService: ProductsService,
    private securityService: SecurityService,
    private router: Router) { }

  products: Product[] = []

  ngOnInit(): void {
    if(this.securityService.isLoggedIn()) {
      this.getAll()
    } else {
      this.router.navigate(['/login'])
    }
  }

  getAll(){
    this.productsService.getAll()
    .subscribe({
      next: products => {this.products = products},
      error: error => {console.log(error)}
    })
  }

  delete(id: number){
    if(this.securityService.isLoggedIn()) {
      this.productsService.delete(id)
      .subscribe({
        next: () => {this.reloadCurrentPage()}
      })
    } else {
      this.router.navigate(['/login'])
    }
  }

  reloadCurrentPage(){
    window.location.reload()
  }

}
