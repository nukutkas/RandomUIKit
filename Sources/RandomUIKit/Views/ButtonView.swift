//
//  ButtonView.swift
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit

/// View для экрана
public final class ButtonView: UIButton {
    
    // MARK: - Public properties
    
    /// Настраиваем фон кнопки
    /// - Parameter gradientBackground: Градиент цветов для кнопки
    public var gradientBackground = [RandomColor.primaryGreen,
                                     RandomColor.secondaryGreen] {
        didSet {
            applyGradient(colors: gradientBackground)
        }
    }
    
    public override var intrinsicContentSize: CGSize {
        Appearance().intrinsicContentSize
    }
    
    public override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        applyGradient(colors: gradientBackground, alpha: Appearance().alphaButton)
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        impactFeedback.impactOccurred()
        applyGradient(colors: gradientBackground)
    }
    
    // MARK: - Private properties
    
    private let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        applyDefaultBehavior()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private func
    
    private func applyDefaultBehavior() {
        setTitleColor(RandomColor.secondaryWhite, for: .normal)
        titleLabel?.font = RandomFont.primaryMedium18
        layer.cornerRadius = Appearance().cornerRadius
        
        applyGradient(colors: gradientBackground)
    }
    
    private func applyGradient(colors: [UIColor], alpha: CGFloat = 1) {
        guard let gradientLayer = layer as? CAGradientLayer else { return }
        gradientLayer.colors = colors.map { $0.withAlphaComponent(alpha).cgColor }
    }
}

// MARK: - Appearance

private extension ButtonView {
    struct Appearance {
        let intrinsicContentSize = CGSize(width: UIView.noIntrinsicMetric,
                                          height: 52)
        let cornerRadius: CGFloat = 8
        let alphaButton: CGFloat = 0.9
    }
}
