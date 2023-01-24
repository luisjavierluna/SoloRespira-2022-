import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { DepartmentsService } from 'src/app/departments/departments.service';
import { Category, CategoryCreationDTO } from 'src/app/models/category';
import { Department } from 'src/app/models/department';

@Component({
  selector: 'app-form-categories',
  templateUrl: './form-categories.component.html',
  styleUrls: ['./form-categories.component.css']
})
export class FormCategoriesComponent implements OnInit {

  constructor(
    private formBuilder: FormBuilder,
    private departmentsService: DepartmentsService) { }

  @Input()
  categoryToEditParam: Category = {id: 0, name: '', image: '', departmentId: 0, departmentName: ''}

  @Input()
  errors: string[] = []

  @Output()
  OnSubmit: EventEmitter<CategoryCreationDTO> = new EventEmitter<CategoryCreationDTO>()

  categoryImageChanged = false

  form: FormGroup = this.formBuilder.group({})
  departmentsSelectListOptions: Department[] = []

  ngOnInit(): void {
    this.getAllDepartments()

    this.form = this.formBuilder.group({
      name: ['', {validators: [Validators.required]}],
      departmentId: ['', {validators: [Validators.required, Validators.min(1)]}],
      image: ''
    })
  }

  getAllDepartments(){
    this.departmentsService.getAll()
    .subscribe({
      next: departments => {
        this.departmentsSelectListOptions = departments
      }
    })
  }

  selectedFile(file: any){
    this.categoryImageChanged = true
    this.form.get('image')?.setValue(file)
  }

  saveChanges(){
    if(!this.categoryImageChanged){
      this.form.patchValue({'image': null})
    }

    this.OnSubmit.emit(this.form.value)
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
      return 'You must select a Department from the list'
    }

    return ''
  }
}
