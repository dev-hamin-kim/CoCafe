//
//  CoffeeMenuViewCell.swift
//  CoCafe
//
//  Created by 네모 on 11/27/24.
//

import UIKit

class CoffeeMenuViewCell: UITableViewCell {
    static let identifier = "CoffeeMenuViewCell"

    // 메뉴 이미지
    private let menuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // 메뉴 이름
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // 메뉴 가격
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // 수직 스택뷰 (nameLabel + priceLabel)
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, priceLabel])
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()

    // 수평 스택뷰 (menuImageView + verticalStackView)
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [menuImageView, verticalStackView])
        stackView.axis = .horizontal
        stackView.spacing = 10
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
        // 수평 스택뷰만 추가
        contentView.addSubview(horizontalStackView)

        NSLayoutConstraint.activate([
            // 스택뷰의 전체 레이아웃만 지정
            horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            horizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            horizontalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            horizontalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            // 이미지뷰의 크기 지정
            menuImageView.widthAnchor.constraint(equalToConstant: 60),
            menuImageView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }

    func configure(with item: Item) {
        menuImageView.image = UIImage(named: item.icon)
        nameLabel.text = item.name
        priceLabel.text = "\(item.price)원"
    }
}
