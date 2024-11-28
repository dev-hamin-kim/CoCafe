//
//  Untitled.swift
//  CoCafe
//
//  Created by 네모 on 11/25/24.
//

import UIKit

protocol CoffeeMenuViewDelegate: AnyObject {
    func didUpdateItem(_ item: Item)
}

class CoffeeMenuView: UIView, UITableViewDataSource, UITableViewDelegate {
    weak var delegate: CoffeeMenuViewDelegate?

    var menuItems: [Item] = []

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none // 밑줄 제거
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CoffeeMenuViewCell.self, forCellReuseIdentifier: "CoffeeMenuViewCell")
    }
    
    private func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func updateMenuItems(for category: Category) { // 카테고리 전달
        menuItems = Item.MenuList.filter { $0.category == category }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeMenuViewCell", for: indexPath) as? CoffeeMenuViewCell else {
            return UITableViewCell()
        }
        
        let item = menuItems[indexPath.row]
        cell.configure(with: item)  // 커스텀 셀을 사용할 경우
        
        // 회색 선택 효과 제거
        cell.selectionStyle = .none

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = menuItems[indexPath.row]
        delegate?.didUpdateItem(selectedItem)
        
        // 디버깅용 출력
        //print("Current Orders: \(cart.orders.map { "\($0.item.name) - \($0.count)" })")
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}