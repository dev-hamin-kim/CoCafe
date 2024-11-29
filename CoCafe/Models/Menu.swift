//
//  Menu.swift
//  CoCafe
//
//  Created by 김하민 on 11/25/24.
//

import Foundation

enum Category: String, CaseIterable {
    case Coffee
    case NonCoffee = "Non-Coffee"
    case Dessert
}

struct Item: Equatable {
    let name: String
    let category: Category
    let price: Int
    let icon: String
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.name == rhs.name
    }
    
    static var MenuList: [Item] = [
        Item(name: "아이스 아메리카노", category: .Coffee, price: 4500, icon: "IcedAmericano"),
        Item(name: "아이스 카페라떼", category: .Coffee, price: 4900, icon: "IcedCafeLatte"),
        Item(name: "코난 라떼", category: .Coffee, price: 5000, icon: "ConanLatte"),
        
        Item(name: "초코 아이스크림 라떼", category: .NonCoffee, price: 5500, icon: "ChocolateIcecreamLatte"),
        Item(name: "딸기 아이스크림 라떼", category: .NonCoffee, price: 5500, icon: "StrawberryIcecreamLatte"),
        Item(name: "캐모마일 티", category: .NonCoffee, price: 4500, icon: "IcedChamomileTea"),
        
        Item(name: "크로칸 슈", category: .Dessert, price: 5000, icon: "CroquantChoux"),
        Item(name: "치즈케이크", category: .Dessert, price: 5500, icon: "CheeseCake"),
    ]
}

extension Int {

    private static var commaFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

    internal var withComma: String {
        return Int.commaFormatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
