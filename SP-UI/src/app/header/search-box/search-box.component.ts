import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { debounceTime } from 'rxjs';
import { Product } from 'src/app/models/product';
import { ProductsService } from 'src/app/products/products.service';

@Component({
  selector: 'app-search-box',
  templateUrl: './search-box.component.html',
  styleUrls: ['./search-box.component.css']
})
export class SearchBoxComponent implements OnInit {

  constructor(
    private formBuilder: FormBuilder,
    private productsService: ProductsService,
    private router: Router) { }

  @Output()
  OnSubmit: EventEmitter<void> = new EventEmitter<void>()
  
  form: FormGroup = this.formBuilder.group({})

  products: Product[] = []

  productsOriginal: Product[] = []

  suggestionsSize = 10

  searchLength: string = ''

  searchInput: string = ''

  ngOnInit(): void {
    this.getAll()

    this.form = this.formBuilder.group({
      name: ''
    })

    this.form.valueChanges
    .pipe(debounceTime(300))
    .subscribe({
      next: values => {
        this.products = this.productsOriginal
        this.searchProducts(values)
      }
    })
  }

  getAll(){
    this.productsService.getAll()
    .subscribe({
      next: products => {
        this.products = products
        this.productsOriginal = products
      }
    })
  }

  searchProducts(values: any){
    if(values.name){
      this.products = this.products
      .filter(product => product.name.toUpperCase()
      .includes(values.name.toUpperCase())).slice(0, this.suggestionsSize)
    }

    this.searchLength = this.form.value.name
  }

  startSearch(){
    let searchString: string = this.form.value.name

    if(searchString !== ''){
      this.router.navigate(['/search'],{queryParams:{name:searchString}})
      this.OnSubmit.emit()
    }
  }

  startAdvancedSearch(){
    this.OnSubmit.emit()
  }

  searchSuggestion(productName: string) {
    this.searchInput = productName

    setTimeout(() => {
      this.startSearch()
    }, 300);
  }
}
