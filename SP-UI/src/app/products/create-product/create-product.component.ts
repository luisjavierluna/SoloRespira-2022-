import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Product, ProductCreationDTO } from 'src/app/models/product';
import { SecurityService } from 'src/app/security/security.service';
import { parseAPIErrors } from 'src/app/utilities/utilities';
import { ProductsService } from '../products.service';

@Component({
  selector: 'app-create-product',
  templateUrl: './create-product.component.html',
  styleUrls: ['./create-product.component.css']
})
export class CreateProductComponent implements OnInit {

  constructor(
    private productsService: ProductsService,
    private router: Router, 
    private securityService: SecurityService) { }

  errors: string[] = []

  ngOnInit(): void {
  }

  saveChanges(product: ProductCreationDTO){
    if(this.securityService.isLoggedIn()) {
      this.productsService.add(product)
      .subscribe({
        next: () => {this.router.navigate(['/products'])},
        error: errors => this.errors = parseAPIErrors(errors)
      })
    } else {
      this.router.navigate(["/login"])
    }
  }

}
