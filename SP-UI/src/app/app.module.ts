import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { ReactiveFormsModule } from '@angular/forms';
import { SweetAlert2Module } from '@sweetalert2/ngx-sweetalert2';

import { AppComponent } from './app.component';
import { LandingPageComponent } from './landing-page/landing-page.component';
import { AppRoutingModule } from './app-routing.module';
import { CarouselComponent } from './landing-page/carousel/carousel.component';
import { DepartmentsComponent } from './departments/departments/departments.component';
import { CategoriesComponent } from './categories/categories/categories.component';
import { ProductsComponent } from './products/products/products.component';
import { CreateDepartmentComponent } from './departments/create-department/create-department.component';
import { EditDepartmentComponent } from './departments/edit-department/edit-department.component';
import { CreateCategoryComponent } from './categories/create-category/create-category.component';
import { EditCategoryComponent } from './categories/edit-category/edit-category.component';
import { CreateProductComponent } from './products/create-product/create-product.component';
import { EditProductComponent } from './products/edit-product/edit-product.component';
import { NavbarMenusComponent } from './header/navbar-menus/navbar-menus.component';
import { NavbarMegamenusComponent } from './header/navbar-megamenus/navbar-megamenus.component';
import { FormProductsComponent } from './products/form-products/form-products.component';
import { FormCategoriesComponent } from './categories/form-categories/form-categories.component';
import { FormDepartmentsComponent } from './departments/form-departments/form-departments.component';
import { InputImgComponent } from './utilities/input-img/input-img.component';
import { SearchBoxComponent } from './header/search-box/search-box.component';
import { SearchComponent } from './search/search/search.component';
import { AuthorizedComponent } from './security/authorized/authorized.component';
import { LoginComponent } from './security/login/login.component';
import { SigninComponent } from './security/signin/signin.component';
import { SecurityInterceptorService } from './security/security-interceptor.service';
import { UnauthorizedComponent } from './security/unauthorized/unauthorized.component';
import { ManagementDashboardComponent } from './management-dashboard/management-dashboard.component';
import { ShowErrorsComponent } from './utilities/show-errors/show-errors.component';
import { DepartmentPageComponent } from './header/departments/department-page/department-page.component';
import { ProductPageComponent } from './header/departments/product-page/product-page.component';

@NgModule({
  declarations: [
    AppComponent,
    LandingPageComponent,
    CarouselComponent,
    DepartmentsComponent,
    CategoriesComponent,
    ProductsComponent,
    CreateDepartmentComponent,
    EditDepartmentComponent,
    CreateCategoryComponent,
    EditCategoryComponent,
    CreateProductComponent,
    EditProductComponent,
    NavbarMenusComponent,
    NavbarMegamenusComponent,
    FormProductsComponent,
    FormCategoriesComponent,
    FormDepartmentsComponent,
    InputImgComponent,
    SearchBoxComponent,
    SearchComponent,
    AuthorizedComponent,
    LoginComponent,
    SigninComponent,
    UnauthorizedComponent,
    ManagementDashboardComponent,
    ShowErrorsComponent,
    DepartmentPageComponent,
    ProductPageComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    ReactiveFormsModule,
    SweetAlert2Module.forRoot()
  ],
  providers: [{
    provide: HTTP_INTERCEPTORS,
    useClass: SecurityInterceptorService,
    multi: true
  }],
  bootstrap: [AppComponent]
})
export class AppModule { }
