//
//  MainCardView.swift
//
//  Created by Vitalii Sosin on 01.05.2022.
//

import UIKit
import RandomUIKit

/// View для экрана
final class MainCardView: UIView {
    
    // MARK: - Public properties
    
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
    
    // MARK: - Internal func
    
    // MARK: - Private func
    
    private func configureLayout() {
        
    }
    
    private func applyDefaultBehavior() {
        let appearance = Appearance()
        
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

