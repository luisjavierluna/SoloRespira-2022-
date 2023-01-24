import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { PageProduct, Product, ProductCreationDTO } from '../models/product';

@Injectable({
  providedIn: 'root'
})
export class ProductsService {

  constructor(private http: HttpClient) { }

  private apiURL = environment.apiURL + 'products'

  public getAll():Observable<Product[]>{
    return this.http.get<Product[]>(this.apiURL)
  }
  
  public add(product: ProductCreationDTO):Observable<ProductCreationDTO>{
    const formData = this.buildFormData(product)
    return this.http.post<ProductCreationDTO>(this.apiURL, formData)
  }

  public getById(id: number):Observable<Product>{
    return this.http.get<Product>(`${this.apiURL}/${id}`)
  }

  public getByPageName(name: string):Observable<PageProduct>{
    return this.http.get<PageProduct>(`${this.apiURL}/productPage/${name}`)
  }

  public edit(id: number, product: ProductCreationDTO):Observable<ProductCreationDTO>{
    const formData = this.buildFormData(product)
    return this.http.put<ProductCreationDTO>(`${this.apiURL}/${id}`, formData)
  }

  public delete(id: number):Observable<Product>{
    return this.http.delete<Product>(`${this.apiURL}/${id}`)
  }

  private buildFormData(product: ProductCreationDTO): FormData {
    const formData = new FormData()
    formData.append('name', product.name)

    if(product.image){
      formData.append('image', product.image)
    }

    formData.append('categoryId', product.categoryId.toString())
    formData.append('departmentId', product.departmentId.toString())

    formData.append('price', product.price.toString())
    formData.append('discount', product.discount.toString())
    formData.append('description', product.description)

    return formData
  }
}
