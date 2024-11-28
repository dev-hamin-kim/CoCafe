//
//  Order.swift
//  CoCafe
//
//  Created by 김하민 on 11/25/24.
//

import Foundation

struct Order {
    let item: Item
    var count: Int = 1
    
    mutating func addOne() {
        count += 1
    }
    
    mutating func subtractOne() {
        guard count > 1 else { return }
        count -= 1
    }

}
