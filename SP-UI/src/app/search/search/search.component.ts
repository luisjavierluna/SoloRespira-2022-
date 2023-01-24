import { Location } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { ActivatedRoute, Route, Router } from '@angular/router';
import { debounceTime, from } from 'rxjs';
import { CategoriesService } from 'src/app/categories/categories.service';
import { DepartmentsService } from 'src/app/departments/departments.service';
import { Category } from 'src/app/models/category';
import { Department } from 'src/app/models/department';
import { Product } from 'src/app/models/product';
import { ProductsService } from 'src/app/products/products.service';

@Component({
  selector: 'app-search',
  templateUrl: './search.component.html',
  styleUrls: ['./search.component.css']
})
export class SearchComponent implements OnInit {

  constructor(
    private formBuilder: FormBuilder,
    private productsService: ProductsService,
    private route: ActivatedRoute,
    private location: Location,
    private departmentService: DepartmentsService,
    private categoriesService: CategoriesService) { }

  form: FormGroup = this.formBuilder.group({})
  products: Product[] = []
  productsOriginal: Product[] = []
  departments: Department[] = []
  categories: Category[] = []
  suggestionsSize = 30
  searchLength: string = ''
  
  nameInputParam: string = ''
  categoryInputParam: string = ''
  departmentInputParam: string = ''
  departmentIdInputParam: string = ''
  categoryIdInputParam: string = ''


  ngOnInit(): void {
    this.getAll()
    this.getAllDepartments()

    this.form = this.formBuilder.group({
      name: '',
      departmentId: '',
      categoryId: ''
    })

    this.route.queryParams.subscribe((params: any) => {
      this.form.get('name')?.setValue(params.name)
      this.form.get('departmentId')?.setValue(params.departmentId)
      this.form.get('categoryId')?.setValue(params.categoryId)

      if(params.departmentId !== undefined) {
        this.departmentIdInputParam = params.departmentId
        this.categoryIdInputParam = params.categoryId
      }
    })

    this.form.valueChanges
    .pipe(debounceTime(300))
    .subscribe({
      next: values => {
        this.products = this.productsOriginal
        this.searchProducts(values)
        this.writeSearchParamsURL()
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

  getAllDepartments(){
    this.departmentService.getAll()
    .subscribe({
      next: departments => {
        this.departments = departments
        this.getFilteredCategories()
      }
    })
  }

  getFilteredCategories(){
    let departmentId = this.form.value.departmentId

    if(departmentId != '') {
      this.categoriesService.getFilteredCategories(departmentId)
      .subscribe({
        next: categories => {
          this.categories = categories

          if(this.categories.some(c => c.id === parseInt(this.form.value.categoryId))){
            this.form.value.categoryId
          } else {
            this.form.get('categoryId')?.setValue('0')
          }
        }
      })
    }
  }

  searchProducts(values: any){
    if(values.name){
      this.products = this.products
      .filter(product => product.name.toUpperCase()
      .includes(values.name.toUpperCase())).slice(0, this.suggestionsSize)
    }

    if(values.departmentId > 0){
      this.products = this.products.filter(product => product.departmentId === parseInt(values.departmentId) )
    }

    if(values.categoryId > 0){
      this.products = this.products.filter(product => product.categoryId === parseInt(values.categoryId) )
    }
  }

  private writeSearchParamsURL(){
    var queryStrings = []

    var formValues = this.form.value

    if(formValues.name){
      queryStrings.push(`name=${formValues.name}`)
    }

    if(formValues.departmentId){
      queryStrings.push(`departmentId=${formValues.departmentId}`)
    }

    if(formValues.categoryId){
      queryStrings.push(`categoryId=${formValues.categoryId}`)
    }

    this.location.replaceState('search', queryStrings.join('&'))
  }

  reloadPage(){
    window.location.reload()
  }

}
