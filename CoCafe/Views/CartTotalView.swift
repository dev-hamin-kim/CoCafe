//
//  CartTotalView.swift
//  CoCafe
//
//  Created by t2023-m0072 on 11/25/24.
//
import UIKit
protocol CartTotalViewDelegate: AnyObject {
    func showAlertCartTotalView()
}

final class CartTotalView: UIView {
    let cartTableView = CartTableView()
    weak var delegate: CartTotalViewDelegate?
    var cart: Cart? {
        didSet{
            totalCountLabel.text = "\(cart?.totalQuantity() ?? 0)개"
            totalPriceLabel.text = "총 금액: \(cart?.totalPrice().withComma ?? "0")원"
        }
    }
    
    // 브라운 배경을 넣어주는 뷰 추가
    private lazy var infoContainerStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [totalCountLabel, totalPriceLabel])
        view.backgroundColor = .conanBrown // 전체 줄의 배경색 설정
        view.axis = .horizontal
        view.spacing = 40
        view.alignment = .fill
        view.distribution = .fill
        view.isLayoutMarginsRelativeArrangement = true
        view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)
        return view
    }()
    // 총 개수를 표시하는 레이블
    private let totalCountLabel: UILabel = {
        let label = UILabel()
        label.text = "총 1개 "
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .right
        label.textColor = .white
        return label
    }()
    
    // 총 금액을 표시하는 레이블
    private let totalPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "금액: 0원"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
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
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        
        
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
        addSubview(cartTableView)
        addSubview(lastContainerView)
        
        infoContainerStackView.translatesAutoresizingMaskIntoConstraints = false
        cartTableView.translatesAutoresizingMaskIntoConstraints = false
        lastContainerView.translatesAutoresizingMaskIntoConstraints = false
        // 레이아웃 제약 설정
        NSLayoutConstraint.activate([
            
            // 총 개수와 총 금액을 감싸는 컨테이너 스택 뷰
            infoContainerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            infoContainerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            infoContainerStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -280),
            infoContainerStackView.heightAnchor.constraint(equalToConstant: 58),
            
            cartTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            cartTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            cartTableView.bottomAnchor.constraint(equalTo: lastContainerView.topAnchor, constant: -10),
            cartTableView.topAnchor.constraint(equalTo: infoContainerStackView.bottomAnchor, constant: 10),
            
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
    
    @objc private func cancelButtonTapped() {
        delegate?.showAlertCartTotalView()
    }      // order 인스턴스 삭제하는 작업 필요
}

@available(iOS 17.0, *)
#Preview {
    ViewController()
}

extension ViewController: CartTotalViewDelegate {
   

    func showAlertCartTotalView() {
        let alert = UIAlertController(title: "메뉴 전체 취소", message: "전체 메뉴를 취소하시겠습니까?", preferredStyle: .alert)
        let success = UIAlertAction(title: "확인", style: .default) { action in
            print("확인 버튼이 눌렸습니다.")
        }
        let cancel = UIAlertAction(title: "취소", style: .default) { cancel in
            print("취소 버튼이 눌렸습니다.")
        }
        
        // 뷰 위에 올리는 역할.
        alert.addAction(success)
        alert.addAction(cancel)
        
        // 다음 화면으로 이동.
        present(alert, animated: true, completion: nil)
    }
}



