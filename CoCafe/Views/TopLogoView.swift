//
//  TopLogoView.swift
//  CoCafe
//
//  Created by seohuibaek on 11/27/24.
//
import UIKit

class TopLogoView: UIView {
    private lazy var logoImageView = createImageView(named: "Logo")
    private lazy var conanFaceImageView = createImageView(named: "ConanLogo")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white //view 배경 색상 설정
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createImageView(named imageName: String) -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    func configureUI() {
        [logoImageView, conanFaceImageView].forEach { addSubview($0) }
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            logoImageView.heightAnchor.constraint(equalToConstant: 40),
            logoImageView.widthAnchor.constraint(equalToConstant: 150),
            
            conanFaceImageView.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor),
            conanFaceImageView.trailingAnchor.constraint(equalTo: logoImageView.leadingAnchor, constant: -5),
            conanFaceImageView.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
