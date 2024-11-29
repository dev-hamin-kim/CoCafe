//
//  MenuCategoryViewController.swift
//  CoCafe
//
//  Created by seohuibaek on 11/25/24.
//
import UIKit

final class MainViewController: UIViewController {
    private let mainView = MainView()
    private let coCafeTopView = CoCafeTopView()
    private let menuCategoryView = MenuCategoryView()
    private let coffeeMenuView = CoffeeMenuView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = mainView
        
        mainView.menuCategoryView.delegate = self
        mainView.coffeeMenuView.updateMenuItems(for: .Coffee)
        mainView.coffeeMenuView.delegate = self
        mainView.cartTotalView.delegate = self
    }
}

extension MainViewController: MenuCategoryViewDelegate {
    func categoryChanged(to category: Category) {
        mainView.coffeeMenuView.updateMenuItems(for: category)
    }
}

extension MainViewController: CoffeeMenuViewDelegate {
    func didUpdateItem(_ item: Item) {
        Cart.shared.addToCart(item: item)
    }
}

@available(iOS 17.0, *)
#Preview {
    MainViewController()
}
