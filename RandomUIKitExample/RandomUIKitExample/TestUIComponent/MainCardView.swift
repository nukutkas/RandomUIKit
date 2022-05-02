//
//  MainCardView.swift
//
//  Created by Vitalii Sosin on 01.05.2022.
//

import UIKit
import RandomUIKit

/// View для экрана
final class MainCardView: UIView {
    
    // MARK: - Internal properties
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override var intrinsicContentSize: CGSize {
        let appearance = Appearance()
        return CGSize(width: appearance.contentSize.width,
                      height: appearance.contentSize.height)
    }
    
    // MARK: - Private properties
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let advLabelView = LabelGradientView()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureLayout()
        applyDefaultBehavior()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public func
    
    public func configureWith(image: UIImage?, titleText: String?, advText: String?) {
        imageView.image = image
        imageView.setImageColor(color: RandomColor.primaryWhite)
        titleLabel.text = titleText
        advLabelView.configureWith(titleText: "ХИТ",
                                   primaryColor: RandomColor.primaryRed,
                                   secondaryColor: RandomColor.secondaryRed)
    }
    
    // MARK: - Private func
    
    private func configureLayout() {
        [imageView, titleLabel, advLabelView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 32),
            imageView.heightAnchor.constraint(equalToConstant: 32),
            
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            advLabelView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            advLabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
    
    private func applyDefaultBehavior() {
        let appearance = Appearance()
        
        titleLabel.textColor = RandomColor.primaryWhite
        titleLabel.font = RandomFont.primaryMedium18
        
        layer.cornerRadius = appearance.cornerRadius
        applyGradient(colors: [
            RandomColor.primaryGreen,
            RandomColor.secondaryGreen
        ])
    }
    
    private func applyGradient(colors: [UIColor]) {
        guard let gradientLayer = layer as? CAGradientLayer else { return }
        gradientLayer.colors = colors.map { $0.cgColor }
    }
}

// MARK: - Appearance

private extension MainCardView {
    struct Appearance {
        let contentSize = CGSize(width: 160, height: 85)
        let cornerRadius: CGFloat = 8
    }
}

