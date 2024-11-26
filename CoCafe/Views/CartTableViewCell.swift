//
//  CartTableViewCell.swift
//  CoCafe
//
//  Created by 이명지 on 11/25/24.
//
import UIKit

final class CartTableViewCell: UITableViewCell {
    let menuNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "아이스 아메리카노"
        label.textColor = .conanBrown
        return label
    }()
    
    let minusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("-", for: .normal)
        button.setTitleColor(.conanBrown, for: .normal)
        return button
    }()
    
    let plusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("+", for: .normal)
        button.setTitleColor(.conanBrown, for: .normal)
        return button
    }()
}

extension UIColor {
    static let conanBrown = UIColor(red: 108, green: 77, blue: 30, alpha: 1.0)
}
