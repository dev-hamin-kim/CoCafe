//
//  MenuCategoryViewController.swift
//  CoCafe
//
//  Created by seohuibaek on 11/25/24.
//

import UIKit

final class MainViewController: UIViewController {
    var mainView: MainView! //스택뷰로 View 병합
    var coCafeTopView: CoCafeTopView! //addSubView로 View 병합
    
    private let menuCategoryView = MenuCategoryView()
    private let coffeeMenuView = CoffeeMenuView()
    
    var cart = Cart(orders: [])  // Cart 객체 초기화
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView = MainView()
        view = mainView
        
        mainView.menuCategoryView.delegate = self
        mainView.coffeeMenuView.updateMenuItems(for: .Coffee) // 초기 데이터 설정
        
        mainView.coffeeMenuView.delegate = self  // delegate 설정
    }
}

extension MainViewController: MenuCategoryViewDelegate {
    func categoryChanged(to category: Category) {
        mainView.coffeeMenuView.updateMenuItems(for: category)
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
