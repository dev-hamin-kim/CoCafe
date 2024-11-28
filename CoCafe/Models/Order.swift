//
//  Order.swift
//  CoCafe
//
//  Created by 김하민 on 11/25/24.
//

import Foundation

class Order {
    var item: Item
    var count = 1 {
        didSet {
            Cart.shared.notifyObservers()
        }
    }
    
    init(item: Item, count: Int) {
        self.item = item
        self.count = count
    }
    
    func addOne() {
        count += 1
    }
    
    func subtractOne() {
        if count > 1 {
            count -= 1
        }
    }
}
