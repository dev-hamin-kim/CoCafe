//
//  Cart.swift
//  CoCafe
//
//  Created by 김하민 on 11/25/24.
//

protocol Observer: AnyObject {
    func cartDidUpdate()
}

class Cart {
    var orders = [Order]()
    static let shared = Cart()
    private var observers = [Observer]()
    
    private init() {}
    
    /// Cart 내 Order들의 총 가격을 출력합니다.
    /// 4,900 처럼 comma 처리가 된 String이 필요하시다면, .totalPrice().withComma로 호출하시면 됩니다.
    func totalPrice() -> Int {
        var result: Int = 0
        
        for order in orders {
            result += (order.item.price * order.count)
        }
        
        return result
    }
    
    
    /// Cart 내 Order들의 총 갯수를 출력합니다.
    func totalQuantity() -> Int {
        var result: Int = 0
        
        for order in orders {
            result += order.count
        }
        
        return result
    }
    
    func deleteOrder(in row: Int) {
        orders.remove(at: row)
        notifyObservers()
    }
    
    func clearCart() {
        orders.removeAll()
        notifyObservers()
    }
    
    func addToCart(item: Item) {
        let hasSameItem = orders.contains(where: { $0.item == item })
        if !hasSameItem {
            let newOrder = Order(item: item, count: 1)
            orders.append(newOrder)
        } else {
            for index in 0..<orders.count {
                if orders[index].item == item {
                    orders[index].addOne()
                    break
                }
            }
        }
        notifyObservers()
    }
    
    func addObserver(_ observer: Observer) {
        observers.append(observer)
    }
    
    func removeObserver(_ observer: Observer) {
        observers.removeAll { $0 === observer }
    }
    
    func notifyObservers() {
        for observer in observers {
            observer.cartDidUpdate()
        }
    }
}
