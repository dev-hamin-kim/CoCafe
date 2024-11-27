//
//  Untitled.swift
//  CoCafe
//
//  Created by 네모 on 11/25/24.
//

import UIKit

// 메뉴 데이터 모델
// 각 메뉴는 이름(name)과 가격(price)만 포함합니다.
struct Menu {
    let name: String
    let price: String
}

// 테이블뷰를 포함한 메인 UI 뷰
class CoffeeMenuView: UIView {
    
    // 테이블뷰: 메뉴 리스트를 표시
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none // 셀 사이의 밑줄 제거
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // 초기화: 뷰의 레이아웃을 설정
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 레이아웃 설정
    // 테이블뷰를 화면 전체에 배치
    private func setupLayout() {
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
