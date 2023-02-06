import { Component, OnInit } from '@angular/core';
import { Product } from '../models/product';
import { ProductsService } from '../products/products.service';

@Component({
  selector: 'app-landing-page',
  templateUrl: './landing-page.component.html',
  styleUrls: ['./landing-page.component.css']
})
export class LandingPageComponent implements OnInit {

  constructor(private productsService: ProductsService) { }

  product: Product[] = []

  randomProductA: Product = {
    id: 0,
    name: '',
    image: '',
    price: 0,
    discount: 0,
    priceWithDiscount: 0,
    description: '',
    weight: 0,
    height: 0,
    width: 0,
    length: 0,
    categoryId: 0,
    categoryName: '',
    departmentId: 0,
    departmentName: '',
  }

  randomProductB: Product = {
    id: 0,
    name: '',
    image: '',
    price: 0,
    discount: 0,
    priceWithDiscount: 0,
    description: '',
    weight: 0,
    height: 0,
    width: 0,
    length: 0,
    categoryId: 0,
    categoryName: '',
    departmentId: 0,
    departmentName: '',
  }

  ngOnInit(): void {
    this.productsService.getAll()
    .subscribe({
      next: response => {
        this.randomProductA = response[Math.floor(Math.random()*response.length)]
        this.randomProductB = response[Math.floor(Math.random()*response.length)]
      },
      error: error => {console.log(error)}
    })
  }

}
