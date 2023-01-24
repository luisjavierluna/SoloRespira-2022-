import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { parseAPIErrors } from 'src/app/utilities/utilities';
import { userCredentials } from '../security';
import { SecurityService } from '../security.service';

@Component({
  selector: 'app-signin',
  templateUrl: './signin.component.html',
  styleUrls: ['./signin.component.css']
})
export class SigninComponent implements OnInit {

  constructor(
    private formBuilder: FormBuilder,
    private securityService: SecurityService,
    private router: Router) { }

  errors: string[] = []

  form: FormGroup = this.formBuilder.group({})

  ngOnInit(): void {
    this.form = this.formBuilder.group({
      email: ['', {validators: [Validators.required, Validators.email]}],
      password: ['', {validators: [Validators.required]}],
    })
  }

  getEmailErrorMessage(){
    var field = this.form.get('email')
    if(field?.hasError('required') && field?.touched) {
      return '- Field Email is required'
    }

    if(field?.hasError('email') && field?.touched) {
      return '- Field Email is not valid'
    }

    return ''
  }

  getPasswordErrorMessage() {
    var field = this.form.get('password')

    if(field?.hasError('required') && field?.touched) {
      return '- Field password is required'
    }

    return ''
  }

  signIn() {
    let credentials: userCredentials = {
      email: this.form.value.email,
      password: this.form.value.password
    }

    this.securityService.signIn(credentials)
    .subscribe({
      next: response => {
        this.securityService.saveToken(response)
        this.router.navigate(['/'])
      },
      error: errors => this.errors = parseAPIErrors(errors)
    })
  }

}
