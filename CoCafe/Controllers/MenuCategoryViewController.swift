//
//  MenuCategoryViewController.swift
//  CoCafe
//
//  Created by seohuibaek on 11/25/24.
//

import UIKit

class MenuCategoryViewController: UIViewController {
    
    var menuCategoryView: MenuCategoryView!
    var topLogoView: TopLogoView!
    var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        topLogoView = TopLogoView()
        menuCategoryView = MenuCategoryView()
        
        stackView = UIStackView(arrangedSubviews: [topLogoView, menuCategoryView])
        stackView.axis = .vertical
        stackView.spacing = 10      // 뷰 사이의 간격
        stackView.alignment = .fill // 자식 뷰 가로 크기 채움
        stackView.distribution = .fill // 자식 뷰 비율에 따라 채우기
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        topLogoView.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
}

@available(iOS 17.0, *)
#Preview {
    MenuCategoryViewController()
}
