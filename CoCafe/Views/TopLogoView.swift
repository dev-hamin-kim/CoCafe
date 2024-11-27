//
//  TopLogoView.swift
//  CoCafe
//
//  Created by seohuibaek on 11/27/24.
//
import UIKit

class TopLogoView: UIView {
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Logo"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let conanFaceImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "ConanLogo"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white //view 배경 색상 설정
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        // 오토레이아웃 설정
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(logoImageView)
        
        conanFaceImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(conanFaceImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo:self.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            //logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            //logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 40),
            logoImageView.widthAnchor.constraint(equalToConstant: 150),
            
            conanFaceImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            conanFaceImageView.trailingAnchor.constraint(equalTo: logoImageView.leadingAnchor, constant: 5),
            conanFaceImageView.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
