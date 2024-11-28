//
//  MenuCategoryViewController.swift
//  CoCafe
//
//  Created by seohuibaek on 11/25/24.
//

import UIKit

class MenuCategoryViewController: UIViewController {

    //var stackView: CoCafeTopStackView!
    var coCafeTopView: CoCafeTopView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coCafeTopView = CoCafeTopView()
        view = coCafeTopView
    }
}

//@available(iOS 17.0, *)
//#Preview {
//    MenuCategoryViewController()
//}
