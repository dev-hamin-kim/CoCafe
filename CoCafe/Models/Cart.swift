//
//  Cart.swift
//  CoCafe
//
//  Created by 김하민 on 11/25/24.
//

struct Cart {
    var orders: [Order]
    
    func totalPrice() -> Int {
        var result: Int = 0
        
        for order in orders {
            result += (order.item.price * order.count)
        }
        
        return result
    }
}
