//
//  CartTableViewCell.swift
//  CoCafe
//
//  Created by 이명지 on 11/25/24.
//
import UIKit

final class CartTableViewCell: UITableViewCell {
    private let menuNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "아이스 아메리카노"
        label.textColor = .conanBrown
        return label
    }()
    
    private let minusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("-", for: .normal)
        button.setTitleColor(.conanBrown, for: .normal)
        return button
    }()
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "1"
        label.textColor = .conanBrown
        return label
    }()
    
    private lazy var countStackView: UIStackView = {
        let stview = UIStackView()
        stview.axis = .horizontal
        stview.distribution = .fillEqually
        stview.alignment = .fill
        stview.spacing = 3
        return stview
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("+", for: .normal)
        button.setTitleColor(.conanBrown, for: .normal)
        return button
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "4,900"
        label.textColor = .conanBrown
        return label
    }()
    
    private let deleteButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("X", for: .normal)
        button.setTitleColor(.conanRibbonRed, for: .normal)
        return button
    }()
    
    private lazy var cellStackView: UIStackView = {
        let stview = UIStackView()
        stview.axis = .horizontal
        stview.distribution = .fillEqually
        stview.alignment = .fill
        stview.spacing = 15
        return stview
    }()
}

extension UIColor {
    static let conanBrown = UIColor(red: 108, green: 77, blue: 30, alpha: 1.0)
    static let conanRibbonRed = UIColor(red: 225, green: 66, blue: 66, alpha: 1.0)
}
