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
    
    func totalQuantity() -> Int {
        var result: Int = 0
        
        for order in orders {
            result += order.count
        }
        
        return result
    }
    
    mutating func deleteOrder(in row: Int) {
        orders.remove(at: row)
    }
    
    mutating func clearCart() {
        orders = []
    }
    
    mutating func addToCart(item: Item) {
        var existingOrder = orders.first(where: { $0.item == item })

        guard var existingOrder else {
            return orders.append(Order(item: item, count: 1))
        }
        
        existingOrder.addOne()
        
    }
    
}
