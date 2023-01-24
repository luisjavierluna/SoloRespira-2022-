import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Department, MenuDepartment, PageDepartment } from '../models/department';

@Injectable({
  providedIn: 'root'
})
export class DepartmentsService {

  constructor(private http: HttpClient) { }

  private apiURL = environment.apiURL + 'departments'

  public getAll():Observable<Department[]>{
    return this.http.get<Department[]>(this.apiURL)
  }

  public getAllMenuDepartments(): Observable<MenuDepartment[]>{
    return this.http.get<MenuDepartment[]>(`${this.apiURL}/navbarMenuItems`)
  }

  public add(department: Department):Observable<Department>{
    return this.http.post<Department>(this.apiURL, department)
  }

  public getById(id: number):Observable<Department>{
    return this.http.get<Department>(`${this.apiURL}/${id}`)
  }

  public getByPageName(name: string):Observable<PageDepartment>{
    return this.http.get<PageDepartment>(`${this.apiURL}/departmentPage/${name}`)
  }

  public edit(id: number, department: Department):Observable<Department>{
    return this.http.put<Department>(`${this.apiURL}/${id}`, department)
  }

  public delete(id: number):Observable<Department>{
    return this.http.delete<Department>(`${this.apiURL}/${id}`)
  }
}
