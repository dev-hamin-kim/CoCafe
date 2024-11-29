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
        let items: [String] = Category.allCases.map { $0.rawValue }
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
        
        control.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        
        control.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        control.setBackgroundImage(UIImage(named: "CategorySelectedImage"), for: .selected, barMetrics: .default)
        
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
        
        backgroundColor = .white
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        menuSegmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
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
        if let selectedCategory = Category(rawValue: sender.titleForSegment(at: sender.selectedSegmentIndex) ?? "") {
            delegate?.categoryChanged(to: selectedCategory)
        }
    }
}
