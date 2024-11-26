//
//  MenuCategoryView.swift
//  CoCafe
//
//  Created by seohuibaek on 11/25/24.
//

import UIKit

class MenuCategoryView: UIView {
    private let menuSegmentedControl: UISegmentedControl = {
        let items = ["Coffee", "Non-Coffee", "Dessert"]
        let control = UISegmentedControl(items: items)
        control.selectedSegmentIndex = 0  // 기본 선택값
        control.backgroundColor = .white
        control.selectedSegmentTintColor = .systemBlue  // 선택된 세그먼트 색상
        return control
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        // 오토레이아웃 설정
        menuSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        addSubview(menuSegmentedControl)
        
        NSLayoutConstraint.activate([
            menuSegmentedControl.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10), // 상단에서 10pt 아래
            menuSegmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            menuSegmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            menuSegmentedControl.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
