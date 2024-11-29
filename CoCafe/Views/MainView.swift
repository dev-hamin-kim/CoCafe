//
//  CoCafeTopStackView.swift
//  CoCafe
//
//  Created by seohuibaek on 11/28/24.
//
import UIKit

final class MainView: UIView {
    let menuCategoryView = MenuCategoryView()
    private let topLogoView = TopLogoView()
    let coffeeMenuView = CoffeeMenuView()
    let cartTotalView = CartTotalView()
    
    private lazy var stackView = {
        let stackView = UIStackView(arrangedSubviews: [topLogoView, menuCategoryView, coffeeMenuView, cartTotalView])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        backgroundColor = .white
        
        topLogoView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        menuCategoryView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        coffeeMenuView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
