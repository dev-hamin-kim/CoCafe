//
//  CartTableView.swift
//  CoCafe
//
//  Created by 이명지 on 11/25/24.
//
import UIKit

final class CartTableView: UIView, UITableViewDataSource, UITableViewDelegate {
    let tableView = UITableView()
    var orders = [Order]() {
        didSet { print(orders)}
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureTableView()
        configureConstraints()
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
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartTableViewCell
        cell.configureCellData(order: orders[indexPath.row])
        cell.selectionStyle = .none
        cell.delegate = self
        return cell
    }
}

extension CartTableView: CartTableViewCellDelegate {
    func deleteCartTableViewCell(cell: CartTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        orders.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
    }
}
