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
        control.selectedSegmentTintColor = UIColor(named: "MainColor")  // 선택된 세그먼트 색상
        return control
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white //view 배경 색상 설정
        
        configureUI()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        menuSegmentedControl.addAction(UIAction { [weak self] action in
            guard let sender = action.sender as? UISegmentedControl else { return }
            
            print("선택된 카테고리 인덱스: \(sender.selectedSegmentIndex)")
            
            switch sender.selectedSegmentIndex {
            case 0:
                print("Coffee 선택됨")
            case 1:
                print("Non-Coffee 선택됨")
            case 2:
                print("Dessert 선택됨")
            default:
                break
            }
        }, for: .valueChanged)
        
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
