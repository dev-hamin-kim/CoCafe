//
//  CoffeeMenuViewController.swift
//  CoCafe
//
//  Created by 네모 on 11/26/24.
//

import UIKit

class CoffeeMenuViewController: UIViewController {
    private let menuView = CoffeeMenuView()

    // 메뉴 데이터
    private let menuItems: [Menu] = [
        Menu(name: "코난 라떼", price: "5,000", imageName: "conan_latte"),
        Menu(name: "아이스 아메리카노", price: "4,500", imageName: "iced_americano"),
        Menu(name: "아이스 라떼", price: "4,900", imageName: "iced_latte")
    ]

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
        return menuItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CoffeeMenuViewCell.identifier, for: indexPath) as? CoffeeMenuViewCell else {
            return UITableViewCell()
        }
        let menu = menuItems[indexPath.row]
        cell.configure(with: menu)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
