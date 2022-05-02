//
//  LabelGradientView.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit
import RandomUIKit

/// View для экрана
final class LabelGradientView: UIView {
    
    // MARK: - Internal properties
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    // MARK: - Private properties
    private let titleLabel = UILabel()
    
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
    
    public func configureWith(titleText: String?,
                              primaryColor: UIColor,
                              secondaryColor: UIColor) {
        titleLabel.text = titleText
        
        applyGradient(colors: [
            primaryColor,
            secondaryColor
        ])
    }
    
    // MARK: - Private func
    
    private func configureLayout() {
        [titleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2)
        ])
    }
    
    private func applyDefaultBehavior() {
        layer.cornerRadius = Appearance().cornerRadius
        
        titleLabel.textColor = RandomColor.primaryWhite
        titleLabel.font =  RandomFont.primaryRegular16
    }
    
    private func applyGradient(colors: [UIColor]) {
        guard let gradientLayer = layer as? CAGradientLayer else { return }
        gradientLayer.colors = colors.map { $0.cgColor }
    }
}

// MARK: - Appearance

private extension LabelGradientView {
    struct Appearance {
        let cornerRadius: CGFloat = 6
    }
}
