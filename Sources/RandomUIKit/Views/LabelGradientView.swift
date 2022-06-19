//
//  LabelGradientView.swift
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit

/// View для экрана
public final class LabelGradientView: UIView {
  
  // MARK: - Public properties
  
  public override class var layerClass: AnyClass {
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
  
  /// Настраиваем ячейку
  /// - Parameters:
  ///  - titleText: Заголовок на рекламном лайбле
  ///  - gradientDVLabel: Градиент цветов для рекламного лайбла
  public func configureWith(titleText: String?,
                            gradientDVLabel: [UIColor]) {
    titleLabel.text = titleText
    applyGradient(colors: gradientDVLabel)
  }
  
  // MARK: - Private func
  
  private func configureLayout() {
    let appearance = Appearance()
    
    [titleLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: appearance.inset.left),
      titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: appearance.inset.top),
      titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -appearance.inset.right),
      titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -appearance.inset.bottom)
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
    let inset = UIEdgeInsets(top: 2,
                             left: 8,
                             bottom: 2,
                             right: 8)
  }
}
