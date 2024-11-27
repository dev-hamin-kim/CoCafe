//
//  CartTotalView.swift
//  CoCafe
//
//  Created by t2023-m0072 on 11/25/24.
//
import UIKit
final class CartTotalView: UIView {
    // 브라운 배경을 넣어주는 뷰 추가
    private lazy var infoContainerStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [totalCountLabel, totalPriceLabel])
        view.backgroundColor = .conanBrown // 전체 줄의 배경색 설정
        view.axis = .horizontal
        view.spacing = 40
        view.alignment = .trailing
        view.distribution = .fill
        return view
    }()
    // 총 개수를 표시하는 레이블
    private let totalCountLabel: UILabel = {
        let label = UILabel()
        label.text = "총 1개 "
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .right
        label.textColor = .white
        return label
    }()
    
    // 총 금액을 표시하는 레이블
    private let totalPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "금액: 0원"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 전체취소 버튼 UI
    private let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("전체 취소", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .conanRibbonRed
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return button
    }()
    // 결제하기 버튼
    private let payButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("결제하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .conanBrown
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return button
    }()
    private lazy var lastContainerView: UIStackView = {
        let view2 = UIStackView(arrangedSubviews: [cancelButton, payButton])
        view2.axis = .horizontal
        view2.spacing = 15
        view2.distribution = .fillEqually
        view2.alignment = .fill
        return view2
    }()
    
    // 초기화 메서드
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    // 레이아웃 설정
    private func setupLayout() {
        // 서브뷰 추가
        addSubview(infoContainerStackView)
        addSubview(lastContainerView)
        
        infoContainerStackView.translatesAutoresizingMaskIntoConstraints = false
        lastContainerView.translatesAutoresizingMaskIntoConstraints = false
        // 레이아웃 제약 설정
        NSLayoutConstraint.activate([
            
            // 총 개수와 총 금액을 감싸는 컨테이너 스택 뷰
            infoContainerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            infoContainerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            infoContainerStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -280),
            infoContainerStackView.heightAnchor.constraint(equalToConstant: 58),
            
            // 전체 취소와 결제하기를 감싸는 스택뷰
            lastContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            lastContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            lastContainerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -45),
            lastContainerView.heightAnchor.constraint(equalToConstant: 58),
        ])
    }
    
    // 버튼 액션을 외부에서 추가할 수 있도록 메서드 제공
    func setCancelAction(target: Any?, action: Selector) {
        cancelButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func setPayAction(target: Any?, action: Selector) {
        payButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    // 총 금액과 개수를 업데이트
    func updateTotalInfo(totalquantity: Int, totalprice: Int) {
        totalCountLabel.text = "\(totalquantity)개"
        totalPriceLabel.text = "총 금액: \(totalprice)원"
    }
}


@available(iOS 17.0, *)
#Preview {
    ViewController()
}
