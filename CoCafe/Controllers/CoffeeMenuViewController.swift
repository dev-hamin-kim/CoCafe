//
//  CoffeeMenuViewController.swift
//  CoCafe
//
//  Created by 네모 on 11/26/24.
//

import UIKit

// 메인 뷰 컨트롤러: Coffee 메뉴를 표시
class CoffeeMenuViewController: UIViewController {
    
    // 메인 뷰
    private let menuView = CoffeeMenuView()
    
    // Coffee 메뉴 데이터 (현재 화면에서 표시할 메뉴)
    // Non-Coffee 및 Dessert 데이터는 나중에 사용 예정
    private let coffeeMenuItems: [Menu] = [
        Menu(name: "코난 라떼", price: "5,000"),
        Menu(name: "아이스 아메리카노", price: "4,500"),
        Menu(name: "아이스 라떼", price: "4,900")
    ]
    
    // Non-Coffee 메뉴 데이터 (현재 화면에서 사용하지 않음)
    private let nonCoffeeMenuItems: [Menu] = [
        Menu(name: "초코 아이스크림 라떼", price: "5,200"),
        Menu(name: "스트로베리 아이스크림 라떼", price: "5,500"),
        Menu(name: "캐모마일 티", price: "3,800")
    ]
    
    // Dessert 메뉴 데이터 (현재 화면에서 사용하지 않음)
    private let dessertMenuItems: [Menu] = [
        Menu(name: "크로칸 슈", price: "6,000"),
        Menu(name: "치즈케이크", price: "6,500")
    ]
    
    // 뷰 로드: 커스텀 뷰를 설정
    override func loadView() {
        self.view = menuView
    }
    
    // 화면이 로드된 후 호출: 테이블뷰를 설정
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // 테이블뷰 설정
    private func setupTableView() {
        menuView.tableView.dataSource = self // 데이터 소스 설정
        menuView.tableView.delegate = self // 델리게이트 설정
        menuView.tableView.register(MenuCell.self, forCellReuseIdentifier: MenuCell.identifier) // 커스텀 셀 등록
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension CoffeeMenuViewController: UITableViewDataSource, UITableViewDelegate {
    
    // 테이블뷰 섹션의 셀 개수 반환 (현재 Coffee 메뉴 개수만)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffeeMenuItems.count
    }
    
    // 각 셀에 표시할 데이터 구성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.identifier, for: indexPath) as? MenuCell else {
            return UITableViewCell()
        }
        cell.configure(with: coffeeMenuItems[indexPath.row]) // Coffee 데이터 전달
        return cell
    }
    
    // 각 셀의 높이 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

// MARK: - MenuCell
// 커스텀 셀: 메뉴 이름과 가격을 표시
class MenuCell: UITableViewCell {
    
    static let identifier = "MenuCell" // 셀 식별자
    
    // 메뉴 이름 레이블
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 메뉴 가격 레이블
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 초기화: 레이아웃 설정
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 레이아웃 설정: 레이블을 셀에 배치
    private func setupLayout() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            priceLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            priceLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    // 데이터 구성: 전달받은 메뉴 데이터를 레이블에 표시
    func configure(with menu: Menu) {
        nameLabel.text = menu.name
        priceLabel.text = menu.price
    }
}
