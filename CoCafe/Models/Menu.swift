//
//  Menu.swift
//  CoCafe
//
//  Created by 김하민 on 11/25/24.
//

enum Category {
    case Coffee, NonCoffee, Dessert
}

struct Item {
    let name: String
    let category: Category
    let price: Int
    let icon: String
}

