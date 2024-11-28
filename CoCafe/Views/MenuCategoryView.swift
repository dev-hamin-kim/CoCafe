//
//  MenuCategoryView.swift
//  CoCafe
//
//  Created by seohuibaek on 11/25/24.
//

import UIKit

protocol MenuCategoryViewDelegate: AnyObject {
    func categoryChanged(to category: Category)
}

class MenuCategoryView: UIView {
    weak var delegate: MenuCategoryViewDelegate?
    
    private lazy var menuSegmentedControl: UISegmentedControl = {
        let items = ["Coffee", "Non-Coffee", "Dessert"]
        //let items: [String] = Category.allCases.map { $0.rawValue } // model data에서 받오기
        let control = UISegmentedControl(items: items)
        control.selectedSegmentIndex = 0
        
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(named: "MainColor") ?? .black,
            .font: UIFont.systemFont(ofSize: 16)
        ]
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 16)
        ]

        control.setTitleTextAttributes(normalAttributes, for: .normal)
        control.setTitleTextAttributes(selectedAttributes, for: .selected)
        
        //구분 선 삭제
        control.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        
        // 배경 투명 시도 (barMetrics 때문에 default 스타일로 유지 ㅜㅜ
        control.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        control.setBackgroundImage(UIImage(named: "CategorySelectedImage"), for: .selected, barMetrics: .default)
        
        // 코너 라운딩 및 그림자 효과
        control.layer.cornerRadius = 10
        control.layer.shadowColor = UIColor.black.cgColor
        control.layer.shadowOpacity = 0.3
        control.layer.shadowOffset = CGSize(width: 0, height: 2)
        control.layer.shadowRadius = 4
        control.layer.masksToBounds = false
        
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
        menuSegmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        // 오토레이아웃 설정
        menuSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        addSubview(menuSegmentedControl)
        
        NSLayoutConstraint.activate([
            menuSegmentedControl.topAnchor.constraint(equalTo: topAnchor),
            menuSegmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            menuSegmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            menuSegmentedControl.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    @objc private func segmentChanged(_ sender: UISegmentedControl) {
        let selectedCategory: Category
        switch sender.selectedSegmentIndex {
        case 0:
            selectedCategory = .Coffee
        case 1:
            selectedCategory = .NonCoffee
        case 2:
            selectedCategory = .Dessert
        default:
            return
        }
        //print("Delegate: \(delegate)") // delegate가 제대로 설정되었는지 확인
        delegate?.categoryChanged(to: selectedCategory)
    }
}
