//
//  CoCafeTopView.swift
//  CoCafe
//
//  Created by seohuibaek on 11/28/24.
//
import UIKit

//카테고리, 메뉴 뷰 addsubView를 이용하여 병합
class CoCafeTopView: UIView {
    var topLogoView: TopLogoView!
    var menuCategoryView: MenuCategoryView!
    var coffeeMenuView: CoffeeMenuView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white //view 배경 색상 설정
        
        topLogoView = TopLogoView()
        menuCategoryView = MenuCategoryView()
        coffeeMenuView = CoffeeMenuView()
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        // 서브뷰 추가
        addSubview(topLogoView)
        addSubview(menuCategoryView)
        addSubview(coffeeMenuView)
        
        topLogoView.translatesAutoresizingMaskIntoConstraints = false
        menuCategoryView.translatesAutoresizingMaskIntoConstraints = false
        coffeeMenuView.translatesAutoresizingMaskIntoConstraints = false
        // 레이아웃 제약 설정
        NSLayoutConstraint.activate([
            topLogoView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            topLogoView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            topLogoView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            topLogoView.heightAnchor.constraint(equalToConstant: 40),
            
            menuCategoryView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            menuCategoryView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            menuCategoryView.topAnchor.constraint(equalTo: topLogoView.bottomAnchor, constant: 10),
            menuCategoryView.heightAnchor.constraint(equalToConstant: 40),
            
            coffeeMenuView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            coffeeMenuView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            coffeeMenuView.topAnchor.constraint(equalTo: menuCategoryView.bottomAnchor, constant: 5),
            coffeeMenuView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
