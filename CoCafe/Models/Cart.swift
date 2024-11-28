//
//  Cart.swift
//  CoCafe
//
//  Created by 김하민 on 11/25/24.
//

struct Cart {
    var orders: [Order]
    
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
    

    /// Cart 내 row번째 항목을 삭제합니다. (선택 삭제)
    mutating func deleteOrder(in row: Int) {
        orders.remove(at: row)
    }
    

    /// Cart안의 모든 orders를 없앱니다 (전체 취소)
    mutating func clearCart() {
        orders = []
    }
    

    /// 옵션까지 동일한 item이 Cart의 주문내역에 있다면, 같은 item의 count을 1 늘려주고,
    /// 주문내역에 동일한 item이 없다면 해당 item을 count 1으로 넣어줍니다.
    mutating func addToCart(item: Item) {
        let existingOrder = orders.first(where: { $0.item == item })

        guard var existingOrder else { return orders.append(Order(item: item, count: 1)) }

        
        existingOrder.addOne()
        
    }
    
}
