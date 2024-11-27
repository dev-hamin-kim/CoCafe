//
//  CoffeeMenuViewCell.swift
//  CoCafe
//
//  Created by 네모 on 11/27/24.
//

import UIKit

struct Menu {
    let name: String
    let price: String
    let imageName: String
}

class CoffeeMenuViewCell: UITableViewCell {
    static let identifier = "CoffeeMenuViewCell"

    private let menuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        contentView.addSubview(menuImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)

        NSLayoutConstraint.activate([
            menuImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            menuImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            menuImageView.widthAnchor.constraint(equalToConstant: 60),
            menuImageView.heightAnchor.constraint(equalToConstant: 60),

            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: menuImageView.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),

            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            priceLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }

    func configure(with menu: Menu) {
        menuImageView.image = UIImage(named: menu.imageName)
        nameLabel.text = menu.name
        priceLabel.text = menu.price
    }
}
