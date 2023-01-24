import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Category, CategoryCreationDTO } from '../models/category';

@Injectable({
  providedIn: 'root'
})
export class CategoriesService {

  constructor(private http: HttpClient) { }

  private apiURL = environment.apiURL + 'categories'

  public getAll():Observable<Category[]>{
    return this.http.get<Category[]>(this.apiURL)
  }

  public getFilteredCategories(departmentId: number):Observable<Category[]>{
    return this.http.get<Category[]>(`${this.apiURL}/filteredCategories/${departmentId}`)
  }

  public add(category: CategoryCreationDTO){
    const formData = this.buildFormData(category)
    return this.http.post(this.apiURL, formData)
  }

  public getById(id: number):Observable<Category>{
    return this.http.get<Category>(`${this.apiURL}/${id}`)
  }

  public edit(id: number, category: CategoryCreationDTO){
    const formData = this.buildFormData(category)
    return this.http.put(`${this.apiURL}/${id}`, formData)
  }

  public delete(id: number):Observable<Category>{
    return this.http.delete<Category>(`${this.apiURL}/${id}`)
  }

  private buildFormData(category: CategoryCreationDTO): FormData {
    const formData = new FormData()
    formData.append('name', category.name)

    if(category.image){
      formData.append('image', category.image)
    }

    formData.append('departmentId', category.departmentId.toString())

    return formData
  }
}
