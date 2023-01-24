import { Component, Input, OnInit } from '@angular/core';
import { MenuCategory } from 'src/app/models/category';

@Component({
  selector: 'app-navbar-megamenus',
  templateUrl: './navbar-megamenus.component.html',
  styleUrls: ['./navbar-megamenus.component.css']
})
export class NavbarMegamenusComponent implements OnInit {

  constructor() { }

  @Input()
  headerMenuCategoriesParam: MenuCategory[] = []

  ngOnInit(): void {
  }

}
