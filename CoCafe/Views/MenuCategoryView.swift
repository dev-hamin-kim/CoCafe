//
//  MenuCategoryView.swift
//  CoCafe
//
//  Created by seohuibaek on 11/25/24.
//

import UIKit

class MenuCategoryView: UIView {
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Logo"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let conanFaceImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "ConanLogo"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let menuSegmentedControl: UISegmentedControl = {
        let items = ["Coffee", "Non-Coffee", "Dessert"]
        let control = UISegmentedControl(items: items)
        control.selectedSegmentIndex = 0  // 기본 선택값
        control.backgroundColor = .white
        control.selectedSegmentTintColor = UIColor(named: "MainColor")  // 선택된 세그먼트 색상
        control.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        control.setTitleTextAttributes([.foregroundColor: UIColor(named: "MainColor") ?? .black], for: .normal)
        control.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
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
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(logoImageView)
        
        conanFaceImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(conanFaceImageView)
        
        menuSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        addSubview(menuSegmentedControl)
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo:self.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            //logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            //logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 40),
            logoImageView.widthAnchor.constraint(equalToConstant: 150),
            
            conanFaceImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            conanFaceImageView.trailingAnchor.constraint(equalTo: logoImageView.leadingAnchor, constant: 5),
            conanFaceImageView.heightAnchor.constraint(equalToConstant: 40),
            
            menuSegmentedControl.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 10), // 상단에서 10pt 아래
            menuSegmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            menuSegmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            menuSegmentedControl.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}
