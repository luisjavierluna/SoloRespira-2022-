import { Category, MenuCategory, PageCategory } from "./category"

export interface Department {
    id: number
    name: string
    description: string
}

export interface MenuDepartment {
    id: number
    name: string,
    categories: MenuCategory[]
}

export interface PageDepartment {
    id: number
    name: string
    description: string
    categories: PageCategory[]
}