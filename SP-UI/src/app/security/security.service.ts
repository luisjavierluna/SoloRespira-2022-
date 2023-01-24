import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { userCredentials, authenticationResponse } from './security';

@Injectable({
  providedIn: 'root'
})
export class SecurityService {

  constructor(private httpClient: HttpClient) { }

  private apiURL = environment.apiURL + 'accounts'
  private readonly tokenKey = 'token'
  private readonly expirationKey = 'token-expiration'
  private readonly fieldRole = 'role'

  isLoggedIn(): boolean {
    const token = localStorage.getItem(this.tokenKey)

    if(!token){
      return false
    }

    const expiration = localStorage.getItem(this.expirationKey)
    const dateExpiration = new Date(String(expiration))

    if(dateExpiration <= new Date()){
      this.logout()
      return false
    }

    return true
  }

  logout(){
    localStorage.removeItem(this.tokenKey)
    localStorage.removeItem(this.expirationKey)
    window.location.reload()
  }

  getFieldJWT(field: string): string {
    const token = localStorage.getItem(this.tokenKey)

    if(!token) {return ''}

    var dataToken = JSON.parse(atob(token.split('.')[1]))
    return dataToken[field]
  }

  getRole(): string {
    return this.getFieldJWT(this.fieldRole)
  }

  signIn(credentials: userCredentials): Observable<authenticationResponse> {
    return this.httpClient.post<authenticationResponse>(this.apiURL + '/signin', credentials)
  }

  login(credentials: userCredentials): Observable<authenticationResponse> {
    return this.httpClient.post<authenticationResponse>(this.apiURL + '/login', credentials)
  }

  saveToken(authenticationResponse: authenticationResponse){
    localStorage.setItem(this.tokenKey, authenticationResponse.token)
    localStorage.setItem(this.expirationKey, authenticationResponse.expiration.toString())
  }

  getToken() {
    return localStorage.getItem(this.tokenKey)
  }
}
