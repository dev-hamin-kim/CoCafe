//
//  MenuCategoryViewController.swift
//  CoCafe
//
//  Created by seohuibaek on 11/25/24.
//

import UIKit

class MenuCategoryViewController: UIViewController {

    //var stackView: CoCafeTopStackView! //스택뷰로 View 병합
    var coCafeTopView: CoCafeTopView! //addSubView로 View 병합
    
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
