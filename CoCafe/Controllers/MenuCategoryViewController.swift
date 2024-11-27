//
//  MenuCategoryViewController.swift
//  CoCafe
//
//  Created by seohuibaek on 11/25/24.
//

import UIKit

class MenuCategoryViewController: UIViewController {
    
    var menuCategoryView : MenuCategoryView!

    override func loadView() {
        menuCategoryView = MenuCategoryView()
        view = menuCategoryView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

@available(iOS 17.0, *)
#Preview {
    MenuCategoryViewController()
}
