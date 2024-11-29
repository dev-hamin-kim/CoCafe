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

extension MainViewController: CartTotalViewDelegate {
    func showOrderCancelAlert() {
        let alert = UIAlertController(title: "메뉴 전체 취소", message: "전체 메뉴를 취소하시겠습니까?", preferredStyle: .alert)
        let success = UIAlertAction(title: "확인", style: .default) { action in
            Cart.shared.clearCart()
        }
        let cancel = UIAlertAction(title: "취소", style: .default)
        
        alert.addAction(success)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    func showPayAlert() {
        let alert = UIAlertController(title: "결제 하시겠습니까?", message: "", preferredStyle: .alert)
        let success = UIAlertAction(title: "확인", style: .default) { [weak self] action in
            self?.showCompletePayAlert()
        }
        let cancel = UIAlertAction(title: "취소", style: .default)
        
        alert.addAction(success)
        alert.addAction(cancel)

        present(alert, animated: true, completion: nil)
    }
    
    func showCompletePayAlert() {
        let alert = UIAlertController(title: "결제 완료", message: "", preferredStyle: .alert)
        let success  = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(success)

        present(alert, animated: true, completion: nil)
    }
}

@available(iOS 17.0, *)
#Preview {
    MainViewController()
}
