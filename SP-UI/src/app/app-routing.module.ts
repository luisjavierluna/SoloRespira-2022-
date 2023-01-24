import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { first } from 'rxjs';
import { CategoriesComponent } from './categories/categories/categories.component';
import { CreateCategoryComponent } from './categories/create-category/create-category.component';
import { EditCategoryComponent } from './categories/edit-category/edit-category.component';
import { CreateDepartmentComponent } from './departments/create-department/create-department.component';
import { DepartmentsComponent } from './departments/departments/departments.component';
import { EditDepartmentComponent } from './departments/edit-department/edit-department.component';
import { DepartmentPageComponent } from './header/departments/department-page/department-page.component';
import { ProductPageComponent } from './header/departments/product-page/product-page.component';
import { IsAdminGuard } from './is-admin.guard';
import { LandingPageComponent } from './landing-page/landing-page.component';
import { ManagementDashboardComponent } from './management-dashboard/management-dashboard.component';
import { CreateProductComponent } from './products/create-product/create-product.component';
import { EditProductComponent } from './products/edit-product/edit-product.component';
import { ProductsComponent } from './products/products/products.component';
import { SearchComponent } from './search/search/search.component';
import { LoginComponent } from './security/login/login.component';
import { SigninComponent } from './security/signin/signin.component';
import { UnauthorizedComponent } from './security/unauthorized/unauthorized.component';

const routes: Routes = [
  {path: '', component: LandingPageComponent},
  {path: 'departments', component: DepartmentsComponent, canActivate: [IsAdminGuard]},
  {path: 'departments/create', component: CreateDepartmentComponent, canActivate: [IsAdminGuard]},
  {path: 'departments/edit/:id', component: EditDepartmentComponent, canActivate: [IsAdminGuard]},
  {path: 'categories', component: CategoriesComponent, canActivate: [IsAdminGuard]},
  {path: 'categories/create', component: CreateCategoryComponent, canActivate: [IsAdminGuard]},
  {path: 'categories/edit/:id', component: EditCategoryComponent, canActivate: [IsAdminGuard]},
  {path: 'products', component: ProductsComponent, canActivate: [IsAdminGuard]},
  {path: 'products/create', component: CreateProductComponent, canActivate: [IsAdminGuard]},
  {path: 'products/edit/:id', component: EditProductComponent, canActivate: [IsAdminGuard]},
  {path: 'management-dashboard', component: ManagementDashboardComponent, canActivate: [IsAdminGuard]},
  {path: 'signin', component: SigninComponent},
  {path: 'login', component: LoginComponent},
  {path: 'search', component: SearchComponent},
  {path: 'unauthorized', component: UnauthorizedComponent},
  {path: 'department/page/:name', component: DepartmentPageComponent},
  {path: 'product/page/:name', component: ProductPageComponent},
  {path: '**', redirectTo: ''},
]

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
