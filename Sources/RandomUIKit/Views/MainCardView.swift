//
//  MainCardView.swift
//
//  Created by Vitalii Sosin on 01.05.2022.
//

import UIKit

/// View для экрана
public final class MainCardView: UIView {
    
    // MARK: - Public properties
    
    public override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    public override var intrinsicContentSize: CGSize {
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
    
    /// Настраиваем ячейку
    /// - Parameters:
    ///  - imageCard: Иконка на карточке
    ///  - titleCard: Заголовок на карточке
    ///  - isShowADVLabel: Включить рекламный лайбл
    ///  - titleADVText: Заголовок на рекламном лайбле
    public func configureWith(imageCard: UIImage?,
                              titleCard: String?,
                              isShowADVLabel: Bool,
                              titleADVText: String?) {
        imageView.image = imageCard
        titleLabel.text = titleCard
        advLabelView.isHidden = !isShowADVLabel
        
        advLabelView.configureWith(titleText: titleADVText,
                                   gradientDVLabel: [RandomColor.primaryRed,
                                                     RandomColor.secondaryRed])
        imageView.setImageColor(color: RandomColor.primaryWhite)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        applyGradient(colors: [RandomColor.primaryGreen,
                               RandomColor.secondaryGreen],
                      alpha: Appearance().alphaCard)
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        applyGradient(colors: [RandomColor.primaryGreen,
                               RandomColor.secondaryGreen])
    }
    
    // MARK: - Private func
    
    private func configureLayout() {
        let appearance = Appearance()
        
        [imageView, titleLabel, advLabelView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: appearance.imageViewSize.width),
            imageView.heightAnchor.constraint(equalToConstant: appearance.imageViewSize.height),
            
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: appearance.inset),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: appearance.inset),
            
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -appearance.inset),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -appearance.inset),
            
            advLabelView.topAnchor.constraint(equalTo: topAnchor, constant: appearance.inset),
            advLabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -appearance.inset)
        ])
    }
    
    private func applyDefaultBehavior() {
        let appearance = Appearance()
        
        titleLabel.textColor = RandomColor.primaryWhite
        titleLabel.font = RandomFont.primaryMedium18
        
        advLabelView.isHidden = true
        
        layer.cornerRadius = appearance.cornerRadius
        applyGradient(colors: [
            RandomColor.primaryGreen,
            RandomColor.secondaryGreen
        ])
    }
    
    private func applyGradient(colors: [UIColor], alpha: CGFloat = 1) {
        guard let gradientLayer = layer as? CAGradientLayer else { return }
        gradientLayer.colors = colors.map { $0.withAlphaComponent(alpha).cgColor }
    }
}

// MARK: - Appearance

private extension MainCardView {
    struct Appearance {
        let contentSize = CGSize(width: 160, height: 85)
        let cornerRadius: CGFloat = 8
        let imageViewSize: CGSize = CGSize(width: 32, height: 32)
        let inset: CGFloat = 8
        let alphaCard: CGFloat = 0.9
    }
}
