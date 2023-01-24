export interface Product {
    id: number
    name: string
    image: string
    price: number
    discount: number
    priceWithDiscount: number
    description: string
    categoryId: number
    categoryName: string
    departmentId: number
    departmentName: string
}

export interface PageProduct {
    id: number
    name: string
    image: string
    price: number
    discount: number
    priceWithDiscount: number
    description: string
    categoryId: number
    categoryName: string
    departmentId: number
    departmentName: string
}

export interface MenuProduct {
    id: number
    name: string
}

export interface ProductCreationDTO {
    name: string
    image: File
    categoryId: number
    departmentId: number
    price: number
    discount: number
    description: string
}