import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { CategoriesService } from 'src/app/categories/categories.service';
import { DepartmentsService } from 'src/app/departments/departments.service';
import { Category } from 'src/app/models/category';
import { Department } from 'src/app/models/department';
import { Product, ProductCreationDTO } from 'src/app/models/product';

@Component({
  selector: 'app-form-products',
  templateUrl: './form-products.component.html',
  styleUrls: ['./form-products.component.css']
})
export class FormProductsComponent implements OnInit {

  constructor(
    private formBuilder: FormBuilder,
    private departmentsService: DepartmentsService,
    private categoriesService: CategoriesService) { }

  @Input()
  productToEditParam: Product = {
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

  @Input()
  errors: string[] = []
  
  @Output()
  OnSubmit: EventEmitter<ProductCreationDTO> = new EventEmitter<ProductCreationDTO>()
  
  productImageChanged = false

  form: FormGroup = this.formBuilder.group({})
  departmentsSelectListOptions: Department[] = []
  categories: Category[] = []
  categoriesSelectListOptions: Category[] = []

  ngOnInit(): void {
    this.getAllCategories()
    this.getAllDepartments()

    this.form = this.formBuilder.group({
      name: ['', {validators: [Validators.required]}],
      categoryId: ['', {validators: [Validators.required, Validators.min(1)]}],
      departmentId: ['', {validators: [Validators.required, Validators.min(1)]}],
      image: '',
      price: '',
      discount: '',
      description: '',
      weight: '',
      height: '',
      width: '',
      length: '',
    })
  }

  getAllDepartments(){
    this.departmentsService.getAll()
    .subscribe({
      next: departments => {
        setTimeout(() => {
          this.departmentsSelectListOptions = departments
          this.setCategory()
        }, 500);
      }
    })
  }

  getAllCategories(){
    this.categoriesService.getAll()
    .subscribe({
      next: categories => {this.categories = categories}
    })
  }

  selectedFile(file: any){
    this.productImageChanged = true
    this.form.get('image')?.setValue(file)
  }

  saveChanges(){
    if(!this.productImageChanged){
      this.form.patchValue({'image': null})
    }

    this.OnSubmit.emit(this.form.value)
  }

  setCategory(){
    setTimeout(() => {
      this.categoriesSelectListOptions = []
      
      this.productToEditParam.departmentId = this.form.value.departmentId
  
      this.categories.forEach(category => {
        if(category.departmentId == this.productToEditParam.departmentId){
          this.categoriesSelectListOptions.push(category)
        }
      })
    }, 500)
  }

  getNameErrorMessage(){
    var fieldName = this.form.get('name')
    if(fieldName?.hasError('required') && fieldName?.touched) {
      return ' Field Name is required'
    }

    return ''
  }

  getDepartmentErrorMessage(){
    var fieldDepartmentId = this.form.get('departmentId')
    if(fieldDepartmentId?.hasError('required') && fieldDepartmentId?.touched) {
      return 'Field Department is required'
    }

    if(fieldDepartmentId?.hasError('min') && fieldDepartmentId?.touched) {
      return 'You must select a Department'
    }

    return ''
  }

  getCategoryErrorMessage(){
    var fieldCategoryId = this.form.get('categoryId')
    if(fieldCategoryId?.hasError('required') && fieldCategoryId?.touched) {
      return 'Field Category is required'
    }

    if(fieldCategoryId?.hasError('min') && fieldCategoryId?.touched) {
      return 'You must select a Category'
    }

    return ''
  }
}
