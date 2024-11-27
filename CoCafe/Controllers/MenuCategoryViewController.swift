//
//  MenuCategoryViewController.swift
//  CoCafe
//
//  Created by seohuibaek on 11/25/24.
//

import UIKit

class MenuCategoryViewController: UIViewController {

    var stackView: MenuCategoryStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stackView = MenuCategoryStackView()
        view = stackView
    }
}

//@available(iOS 17.0, *)
//#Preview {
//    MenuCategoryViewController()
//}
