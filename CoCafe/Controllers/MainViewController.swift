//
//  MenuCategoryViewController.swift
//  CoCafe
//
//  Created by seohuibaek on 11/25/24.
//

import UIKit

class MainViewController: UIViewController {
    
    var stackView: CoCafeTopStackView! //스택뷰로 View 병합
    var coCafeTopView: CoCafeTopView! //addSubView로 View 병합
    
    private let menuCategoryView = MenuCategoryView()
    private let coffeeMenuView = CoffeeMenuView()
    
    var cart = Cart(orders: [])  // Cart 객체 초기화
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stackView = CoCafeTopStackView()
        view = stackView
        
        stackView.menuCategoryView.delegate = self
        stackView.coffeeMenuView.updateMenuItems(for: .Coffee) // 초기 데이터 설정
        
        stackView.coffeeMenuView.delegate = self  // delegate 설정
    }
}

extension MainViewController: MenuCategoryViewDelegate {
    func categoryChanged(to category: Category) {
        stackView.coffeeMenuView.updateMenuItems(for: category)
    }
}

extension MainViewController: CoffeeMenuViewDelegate {
    func didUpdateItem(_ item: Item) {
        //cart.addToCart(item: item)
        print(item)
    }
}

@available(iOS 17.0, *)
#Preview {
    MainViewController()
}
