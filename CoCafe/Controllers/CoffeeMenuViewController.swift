//
//  CoffeeMenuViewController.swift
//  CoCafe
//
//  Created by 네모 on 11/26/24.
//

import UIKit

class CoffeeMenuViewController: UIViewController {
    private let menuView = CoffeeMenuView()

    private var filteredMenuItems: [Item] = Item.MenuList.filter { $0.category == .Coffee }

    override func loadView() {
        self.view = menuView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        menuView.tableView.dataSource = self
        menuView.tableView.delegate = self
        menuView.tableView.register(CoffeeMenuViewCell.self, forCellReuseIdentifier: CoffeeMenuViewCell.identifier)
    }
}

extension CoffeeMenuViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMenuItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CoffeeMenuViewCell.identifier, for: indexPath) as? CoffeeMenuViewCell else {
            return UITableViewCell()
        }
        let item = filteredMenuItems[indexPath.row]
        cell.configure(with: item)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
