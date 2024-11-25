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
    
    
    static var MenuList: [Item] = [
        Item(name: "아이스 아메리카노", category: .Coffee, price: 4500, icon: "IcedAmericano"),
        Item(name: "아이스 카페라떼", category: .Coffee, price: 4900, icon: "IcedCafeLatte"),
        Item(name: "코난 라떼", category: .Coffee, price: 5000, icon: "ConanLatte"),
        
        Item(name: "초코 아이스크림 라떼", category: .NonCoffee, price: 5500, icon: "ChocolateIcecreamLatte"),
        Item(name: "스트로베리 아이스크림 라떼", category: .NonCoffee, price: 5500, icon: "StrawberryIcecreamLatte"),
        Item(name: "캐모마일 티", category: .NonCoffee, price: 4500, icon: "IcedChamomileTea"),
        
        Item(name: "크로칸 슈", category: .Dessert, price: 5000, icon: "CroquantChoux"),
        Item(name: "치즈케이크", category: .Dessert, price: 5500, icon: "CheeseCake"),
    ]
}

