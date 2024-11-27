//
//  CoffeeMenuViewController.swift
//  CoCafe
//
//  Created by 네모 on 11/26/24.
//

import UIKit

class CoffeeMenuViewController: UIViewController {
    private let coffeeMenuView = CoffeeMenuView() // UI를 구성하는 커스텀 UIView
    private var menuItems: [Item] = Item.MenuList.filter { $0.category == .Coffee } // Coffee 데이터 필터링

    override func loadView() {
        self.view = coffeeMenuView // CoffeeMenuView를 전체 뷰로 설정
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        coffeeMenuView.tableView.dataSource = self
        coffeeMenuView.tableView.delegate = self
        coffeeMenuView.tableView.register(CoffeeMenuViewCell.self, forCellReuseIdentifier: CoffeeMenuViewCell.identifier)
    }
}

extension CoffeeMenuViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CoffeeMenuViewCell.identifier, for: indexPath) as? CoffeeMenuViewCell else {
            return UITableViewCell()
        }
        let item = menuItems[indexPath.row]
        cell.configure(with: item) // 데이터 전달
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
