//
//  CartTableView.swift
//  CoCafe
//
//  Created by 이명지 on 11/25/24.
//
import UIKit

final class CartTableView: UIView, UITableViewDataSource, UITableViewDelegate {
    let tableView = UITableView()
    let orders = Item.MenuList.map { item in
        Order(item: item, count: Int.random(in: 1 ... 20))
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTableView() {
        tableView.register(CartTableViewCell.self, forCellReuseIdentifier: "CartCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartTableViewCell
        cell.configureCellData(order: orders[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}

