import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Category } from 'src/app/models/category';
import { Department } from 'src/app/models/department';

@Component({
  selector: 'app-form-departments',
  templateUrl: './form-departments.component.html',
  styleUrls: ['./form-departments.component.css']
})
export class FormDepartmentsComponent implements OnInit {

  constructor(private formBuilder: FormBuilder) { }

  @Input()
  departmentToEditParam: Department = {id: 0, name: '', description: ''}

  @Input()
  errors: string[] = []

  @Output()
  onSubmit: EventEmitter<Department> = new EventEmitter<Department>()

  form: FormGroup = this.formBuilder.group({})
  
  ngOnInit(): void {
    this.form = this.formBuilder.group({
      name: ['', {validators: [Validators.required]}],
      description: ''
    })
  }

  saveChanges(){
    this.onSubmit.emit(this.form.value)
  }

  getNameErrorMessage(){
    var fieldName = this.form.get('name')
    if(fieldName?.hasError('required') && fieldName?.touched) {
      return ' Field Name is required'
    }

    return ''
  }
}
