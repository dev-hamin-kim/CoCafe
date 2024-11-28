//
//  MenuCategoryViewController.swift
//  CoCafe
//
//  Created by seohuibaek on 11/25/24.
//

import UIKit

class MenuCategoryViewController: UIViewController, MenuCategoryViewDelegate {
    
    var stackView: CoCafeTopStackView! //스택뷰로 View 병합
    var coCafeTopView: CoCafeTopView! //addSubView로 View 병합
    
    private let menuCategoryView = MenuCategoryView()
    private let coffeeMenuView = CoffeeMenuView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // stackView 사용하는 경우
        stackView = CoCafeTopStackView()
        view = stackView
        
        //delegate nil 되는 이슈 발생 -> menuCategoryView.delegate = self 말고 아래와 같이 선언해주어야 함..
        stackView.menuCategoryView.delegate = self
        stackView.coffeeMenuView.updateMenuItems(for: .Coffee) // 초기 데이터 설정
        
        // addsubView 사용하는 경우
        /*coCafeTopView = CoCafeTopView()
        view = coCafeTopView
        
        
        //delegate nil 되는 이슈 발생 -> menuCategoryView.delegate = self 말고 아래와 같이 선언해주어야 함..
        coCafeTopView.menuCategoryView.delegate = self
        coCafeTopView.coffeeMenuView.updateMenuItems(for: .Coffee) // 초기 데이터 설정*/
    }

    func categoryChanged(to category: Category) {
        // stackView 사용하는 경우
        stackView.coffeeMenuView.updateMenuItems(for: category)
        
        // addsubView 사용하는 경우
        //coCafeTopView.coffeeMenuView.updateMenuItems(for: category)
        
        //print(category)
        //print("Category Changed to: \(category)")
    }
}

//@available(iOS 17.0, *)
//#Preview {
//    MenuCategoryViewController()
//}
