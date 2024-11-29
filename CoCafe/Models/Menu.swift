//
//  Menu.swift
//  CoCafe
//
//  Created by 김하민 on 11/25/24.
//

import Foundation


/// 음료의 종류를 enum으로 선언해놓은 Category입니다.
///
/// Category의 모든 case들을 [String]으로 받으시려면 아래의 코드를 사용하시면 됩니다.
///
///     let item: [String] = Category.allCases.map { $0.rawValue }
///
/// 결과는 아래와 같습니다.
///
///     ["Coffee", "Non-Coffee", "Dessert"]
///
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
    
    // 추후 음료 옵션을 넣을 경우 같은 이름을 가진 음료라도 다른 음료로 취급할 수 있게 Equatable 프로토콜을 채택하였습니다.
    // 옵션 넣은 뒤에 옵션도 같은 경우에만 true를 리턴하도록 refactor 예정.
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.name == rhs.name
    }
    
    static var MenuList: [Item] = [
        Item(name: "아이스 아메리카노", category: .Coffee, price: 4000, icon: "IcedAmericano"),
        Item(name: "아이스 카페라떼", category: .Coffee, price: 4900, icon: "IcedCafeLatte"),
        Item(name: "코난 라떼", category: .Coffee, price: 6000, icon: "ConanLatte"),
        Item(name: "카페 라떼", category: .Coffee, price: 4500, icon: "CafeLatte"),
        Item(name: "카페 모카", category: .Coffee, price: 5000, icon: "CafeMocha"),
        Item(name: "아이스 카페모카", category: .Coffee, price: 5500, icon: "IcedCafeMocha"),
        
        Item(name: "초코 아이스크림 라떼", category: .NonCoffee, price: 5500, icon: "ChocolateIcecreamLatte"),
        Item(name: "딸기 아이스크림 라떼", category: .NonCoffee, price: 5500, icon: "StrawberryIcecreamLatte"),
        Item(name: "캐모마일 티", category: .NonCoffee, price: 4500, icon: "IcedChamomileTea"),
        Item(name: "핫 코코아", category: .NonCoffee, price: 5000, icon: "HotCocoa"),
        Item(name: "아이스 코코아", category: .NonCoffee, price: 5000, icon: "IcedCocoa"),
        Item(name: "말차 라떼", category: .NonCoffee, price: 5000, icon: "MatchaLatte"),
        
        Item(name: "크로칸 슈", category: .Dessert, price: 3500, icon: "CroquantChoux"),
        Item(name: "치즈케이크", category: .Dessert, price: 5500, icon: "CheeseCake"),
        Item(name: "초콜릿 헤이즐넛 케이크", category: .Dessert, price: 5000, icon: "ChocolateHazelnutCake"),
        Item(name: "딸기 케이크", category: .Dessert, price: 5000, icon: "StrawberryCake"),
        Item(name: "에그타르트", category: .Dessert, price: 3000, icon: "EggTart"),
        Item(name: "티라미수", category: .Dessert, price: 4500, icon: "Tiramisu")
    ]
}


// Int 4900을 String "4,900"으로 포맷해주는 extension입니다.
// 변환이 필요한 Int형 자료 뒤에 .withComma를 붙여 사용하시면 됩니다.
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
