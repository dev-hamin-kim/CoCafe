//
//  CoffeeMenuViewController.swift
//  CoCafe
//
//  Created by 네모 on 11/26/24.
//

import UIKit

class CoffeeMenuViewController: UIViewController {
    private let menuView = CoffeeMenuView()
    private var menuItems: [Item]

    // 기본 생성자에서 Coffee 데이터를 필터링하도록 수정
    init(menuItems: [Item] = Item.MenuList.filter { $0.category == .Coffee }) {
        self.menuItems = menuItems
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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
        let item = menuItems[indexPath.row]
        cell.configure(with: item)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
