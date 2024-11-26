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
}
