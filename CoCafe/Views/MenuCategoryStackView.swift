//
//  MenuCategoryStackView.swift
//  CoCafe
//
//  Created by seohuibaek on 11/27/24.
//

import UIKit

class MenuCategoryStackView: UIView {
    var menuCategoryView: MenuCategoryView!
    var topLogoView: TopLogoView!
    var stackView: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white //view 배경 색상 설정
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        topLogoView = TopLogoView()
        menuCategoryView = MenuCategoryView()
        
        stackView = UIStackView(arrangedSubviews: [topLogoView, menuCategoryView])
        stackView.axis = .vertical
        stackView.spacing = 10      // 뷰 사이의 간격
        //stackView.alignment = .fill // 자식 뷰 가로 크기 채움
        stackView.distribution = .fillEqually// 자식 뷰 비율에 따라 채우기
        stackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
}

//@available(iOS 17.0, *)
//#Preview {
//    MenuCategoryViewController()
//}
