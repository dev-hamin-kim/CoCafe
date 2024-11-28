//
//  CartTableView.swift
//  CoCafe
//
//  Created by 이명지 on 11/25/24.
//
import UIKit

final class CartTableView: UIView, UITableViewDataSource, UITableViewDelegate {
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureTableView()
        configureConstraints()
        Cart.shared.addObserver(self)
    }
    
    deinit {
        Cart.shared.removeObserver(self) // 옵저버 제거
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTableView() {
        tableView.register(CartTableViewCell.self, forCellReuseIdentifier: "CartCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        self.addSubview(tableView)
    }
    
    private func configureConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Cart.shared.orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartTableViewCell
        cell.configureCellData(order: Cart.shared.orders[indexPath.row])
        cell.selectionStyle = .none
        cell.delegate = self
        return cell
    }
}

extension CartTableView: CartTableViewCellDelegate {
    func deleteCartTableViewCell(cell: CartTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        Cart.shared.deleteOrder(in: indexPath.row)
//        tableView.reloadData()
    }
}

extension CartTableView: Observer {
    func cartDidUpdate() {
        tableView.reloadData()
    }
}
