//
//  CoffeeMenuViewCell.swift
//  CoCafe
//
//  Created by 네모 on 11/27/24.
//

import UIKit

class CoffeeMenuViewCell: UITableViewCell {
    private let menuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, priceLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [menuImageView, verticalStackView])
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.addSubview(horizontalStackView)
        
        NSLayoutConstraint.activate([
            menuImageView.widthAnchor.constraint(equalToConstant: 60),
            menuImageView.heightAnchor.constraint(equalToConstant: 60),
            
            horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            horizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            horizontalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            horizontalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func configure(with item: Item) {
        menuImageView.image = UIImage(named: item.icon)
        nameLabel.text = item.name
        priceLabel.text = "\(item.price.withComma)원"
    }
}
