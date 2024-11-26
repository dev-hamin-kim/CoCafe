//
//  CartTotalView.swift
//  CoCafe
//
//  Created by t2023-m0072 on 11/25/24.
//
import UIKit
final class CartTotalView: UIView {
    
    // 총 개수를 표시하는 레이블
    private let totalCountLabel: UILabel = {
        let label = UILabel()
        label.text = "0개"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 총 금액을 표시하는 레이블
    private let totalPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "총 금액: 0원"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 전체취소 버튼 UI
    private let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("전체 취소", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
}
@available(iOS 17.0, *)
#Preview {
ViewController()
}
