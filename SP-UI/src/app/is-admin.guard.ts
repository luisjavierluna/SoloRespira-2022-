import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree } from '@angular/router';
import { Observable } from 'rxjs';
import { SecurityService } from './security/security.service';

@Injectable({
  providedIn: 'root'
})
export class IsAdminGuard implements CanActivate {

  constructor(
    private securityService: SecurityService,
    private router: Router) { }

  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): Observable<boolean | UrlTree> | Promise<boolean | UrlTree> | boolean | UrlTree {
    
      if(this.securityService.isLoggedIn() === true && this.securityService.getRole() === 'admin') {
        return true

      } else if (this.securityService.isLoggedIn() === true && this.securityService.getRole() !== 'admin') {
        return this.router.navigate(['/unauthorized'])

      } else if (this.securityService.isLoggedIn() !== true && this.securityService.getRole() === 'admin') {
        return this.router.navigate(['/login'])

      } else if (this.securityService.isLoggedIn() !== true && this.securityService.getRole() !== 'admin') {
        return this.router.navigate(['/login'])

      }

      this.router.navigate(['/login'])

    return false;
  }
  
}
