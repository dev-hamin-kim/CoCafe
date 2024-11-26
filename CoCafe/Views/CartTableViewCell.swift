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
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = ""
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
        label.text = ""
        label.textAlignment = .center
        label.textColor = .conanBrown
        return label
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("+", for: .normal)
        button.setTitleColor(.conanBrown, for: .normal)
        return button
    }()
    
    private lazy var countStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [minusButton, countLabel, plusButton])
        stview.axis = .horizontal
        stview.distribution = .fillProportionally
        stview.alignment = .fill
        stview.spacing = 0
        return stview
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = ""
        label.textAlignment = .center
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
        let stview = UIStackView(arrangedSubviews: [menuNameLabel, countStackView, priceLabel, deleteButton])
        stview.axis = .horizontal
        stview.distribution = .equalSpacing
        stview.alignment = .fill
        stview.spacing = 15
        return stview
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        configureStackViews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureStackViews() {
        self.contentView.addSubview(cellStackView)
    }
    
    private func configureConstraints() {
        cellStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cellStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 26),
            cellStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            cellStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            cellStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func configureCellData(order: Order) {
        self.menuNameLabel.text = order.item.name
        self.countLabel.text = order.count.description
        self.priceLabel.text = order.item.price.description
    }
}

extension UIColor {
    static let conanBrown = UIColor(red: 108/255, green: 77/255, blue: 30/255, alpha: 1.0)
    static let conanRibbonRed = UIColor(red: 225/255, green: 66/255, blue: 66/255, alpha: 1.0)
}

@available(iOS 17.0, *)
#Preview {
    ViewController()
}
