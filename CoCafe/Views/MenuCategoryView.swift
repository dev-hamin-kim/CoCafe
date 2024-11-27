//
//  MenuCategoryView.swift
//  CoCafe
//
//  Created by seohuibaek on 11/25/24.
//

import UIKit

class MenuCategoryView: UIView {
    
    private lazy var menuSegmentedControl: UISegmentedControl = {
        let items = ["Coffee", "Non-Coffee", "Dessert"]
        let control = UISegmentedControl(items: items)
        control.selectedSegmentIndex = 0
        control.selectedSegmentTintColor = UIColor(named: "MainColor")
        
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(named: "MainColor") ?? .black,
            .font: UIFont.systemFont(ofSize: 16)
        ]
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 16)
        ]
        
        // 흰색으로 배경 설정해도 적용되지 않음
        //control.backgroundColor = .white
                
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
        //        menuSegmentedControl.addAction(UIAction { [weak self] action in
        //            guard let sender = action.sender as? UISegmentedControl else { return }
        //            
        //            print("선택된 카테고리 인덱스: \(sender.selectedSegmentIndex)")
        //            
        //            switch sender.selectedSegmentIndex {
        //            case 0:
        //                print("Coffee 선택됨")
        //            case 1:
        //                print("Non-Coffee 선택됨")
        //            case 2:
        //                print("Dessert 선택됨")
        //            default:
        //                break
        //            }
        //        }, for: .valueChanged)
        
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
}
