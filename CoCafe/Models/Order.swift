//
//  Order.swift
//  CoCafe
//
//  Created by 김하민 on 11/25/24.
//

import Foundation

protocol OrderDelegate: AnyObject {
    func orderDidChange(order: Order)
}

class Order {
    var item: Item
    var count = 1 {
        didSet {
            delegate?.orderDidChange(order: self)
        }
    }
    weak var delegate: OrderDelegate?
    
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
