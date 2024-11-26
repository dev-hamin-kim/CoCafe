//
//  CartTotalView.swift
//  CoCafe
//
//  Created by t2023-m0072 on 11/25/24.
//
import UIKit
final class CartTotalView: UIView {
    // 브라운 배경을 넣어주는 뷰 추가
    private let infoContainerView: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = UIColor.conanBrown // 전체 줄의 배경색 설정
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let lastContainerView: UIStackView = {
        let view2 = UIStackView()
        view2.backgroundColor = .orange
        view2.translatesAutoresizingMaskIntoConstraints = false
        view2.distribution = .fillEqually
        view2.alignment = .fill
        view2.spacing = 15
        return view2
    }()
    // 총 개수를 표시하는 레이블
    private let totalCountLabel: UILabel = {
        let label = UILabel()
        label.text = "총 0개"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
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
        button.backgroundColor = UIColor.conanRibbonRed
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    // 결제하기 버튼
    private let payButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("결제하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.conanBrown
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        addSubview(infoContainerView)
        addSubview(lastContainerView)
        
        infoContainerView.addSubview(totalCountLabel)
        infoContainerView.addSubview(totalPriceLabel)
        
        lastContainerView.addSubview(cancelButton)
        lastContainerView.addSubview(payButton)
        
        addSubview(totalCountLabel)
        addSubview(totalPriceLabel)
        addSubview(cancelButton)
        addSubview(payButton)
        
        // 레이아웃 제약 설정
        NSLayoutConstraint.activate([
            // 총 개수와 총 금액을 감싸는 컨테이너 스택 뷰
            infoContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            infoContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            infoContainerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -280),
            infoContainerView.heightAnchor.constraint(equalToConstant: 58),
            
            // 전체 취소와 결제하기를 감싸는 스택뷰
            lastContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lastContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lastContainerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -45),
            lastContainerView.heightAnchor.constraint(equalToConstant: 58),

            // 총 개수 레이블
            totalCountLabel.leadingAnchor.constraint(equalTo: totalPriceLabel.leadingAnchor, constant: -90),
            totalCountLabel.topAnchor.constraint(equalTo: topAnchor, constant: 550),
            
            // 총 금액 레이블
            totalPriceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            totalPriceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 550),
            
            // 전체 취소 버튼
            cancelButton.topAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            cancelButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            cancelButton.heightAnchor.constraint(equalToConstant: 50),
            cancelButton.widthAnchor.constraint(equalToConstant: 150),

            // 결제하기 버튼
            payButton.topAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            payButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            payButton.heightAnchor.constraint(equalToConstant: 50),
            payButton.widthAnchor.constraint(equalToConstant: 150),
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
extension UIColor {
    static let conanBrown = UIColor(red: 108/255, green: 77/255, blue: 30/255, alpha: 1.0)
    static let conanRibbonRed = UIColor(red: 225/255, green: 66/255, blue: 66/255, alpha: 1.0)
}
@available(iOS 17.0, *)
#Preview {
    ViewController()
}
