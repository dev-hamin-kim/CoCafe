//
//  CoCafeTopStackView.swift
//  CoCafe
//
//  Created by seohuibaek on 11/28/24.
//

import UIKit

//stackView로 카테고리와 메뉴 뷰 병합
final class MainView: UIView {
    private let menuCategoryView = MenuCategoryView()
    private let topLogoView = TopLogoView()
    private let coffeeMenuView = CoffeeMenuView()
    private let cartTotalView = CartTotalView()
    var stackView: UIStackView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        backgroundColor = .white //view 배경 색상 설정
        
        topLogoView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        menuCategoryView.heightAnchor.constraint(equalToConstant: 50).isActive = true

        stackView = UIStackView(arrangedSubviews: [topLogoView, menuCategoryView, coffeeMenuView])
        stackView.axis = .vertical
        stackView.spacing = 10 // 뷰 사이의 간격
        stackView.alignment = .fill // 자식 뷰 가로 크기 채움
        stackView.distribution = .fill

        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

//@available(iOS 17.0, *)
//#Preview {
//    MenuCategoryViewController()
//}
