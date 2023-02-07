import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { PageProduct } from 'src/app/models/product';
import { ProductsService } from 'src/app/products/products.service';

@Component({
  selector: 'app-product-page',
  templateUrl: './product-page.component.html',
  styleUrls: ['./product-page.component.css']
})
export class ProductPageComponent implements OnInit {

  constructor(
    private activatedRoute: ActivatedRoute,
    private productsService: ProductsService) { }

  productPage: PageProduct = {
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
    departmentName: ''
  }


  ngOnInit(): void {

    window.scrollTo(0, 1)
    

    this.activatedRoute.params.subscribe(params => {
      this.productsService.getByPageName(params['name'])
      .subscribe({
        next: productResponse => {
          this.productPage = productResponse
        },
        error: error => {console.log(error)}
      })
    })

  }
}
