//
//  CartTotalView.swift
//  CoCafe
//
//  Created by t2023-m0072 on 11/25/24.
//
import UIKit
protocol CartTotalViewDelegate: AnyObject {
    func showOrderCancelAlert()
    func showPayAlert()
    func showCompletePayAlert()
}

final class CartTotalView: UIView {
    let cartTableView = CartTableView()
    weak var delegate: CartTotalViewDelegate?
    
    private lazy var infoContainerStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [totalCountLabel, totalPriceLabel])
        view.backgroundColor = .conanBrown
        view.axis = .horizontal
        view.spacing = 40
        view.alignment = .fill
        view.distribution = .fill
        view.isLayoutMarginsRelativeArrangement = true
        view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)
        return view
    }()
    
    private let totalCountLabel: UILabel = {
        let label = UILabel()
        label.text = "총 0개 "
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .right
        label.textColor = .white
        return label
    }()
    
    private let totalPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "금액: 0원"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("전체 취소", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .conanRibbonRed
        button.layer.cornerRadius = 18
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    private let payButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("결제하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .conanBrown
        button.layer.cornerRadius = 18
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    private lazy var lastContainerView: UIStackView = {
        let view2 = UIStackView(arrangedSubviews: [cancelButton, payButton])
        view2.axis = .horizontal
        view2.spacing = 8
        view2.distribution = .fillEqually
        view2.alignment = .fill
        return view2
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        Cart.shared.addObserver(self)
        setupLayout()
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        payButton.addTarget(self, action: #selector(payButtonTapped), for: .touchUpInside)
    }
    
    deinit {
        Cart.shared.removeObserver(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(infoContainerStackView)
        addSubview(cartTableView)
        addSubview(lastContainerView)
        
        infoContainerStackView.translatesAutoresizingMaskIntoConstraints = false
        cartTableView.translatesAutoresizingMaskIntoConstraints = false
        lastContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            infoContainerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            infoContainerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            infoContainerStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -280),
            infoContainerStackView.heightAnchor.constraint(equalToConstant: 58),
            
            totalPriceLabel.widthAnchor.constraint(equalToConstant: 140),
            
            cartTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            cartTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            cartTableView.bottomAnchor.constraint(equalTo: lastContainerView.topAnchor, constant: -10),
            cartTableView.topAnchor.constraint(equalTo: infoContainerStackView.bottomAnchor, constant: 10),
            
            lastContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            lastContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            lastContainerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 5),
            lastContainerView.heightAnchor.constraint(equalToConstant: 58),
        ])
    }
    
    @objc private func cancelButtonTapped() {
        delegate?.showOrderCancelAlert()
    }
    
    @objc private func payButtonTapped() {
        delegate?.showPayAlert()
    }
}

extension CartTotalView: Observer {
    func cartDidUpdate() {
        totalCountLabel.text = "총 \(Cart.shared.totalQuantity())개"
        totalPriceLabel.text = "금액: \(Cart.shared.totalPrice().withComma)원"
    }
}
