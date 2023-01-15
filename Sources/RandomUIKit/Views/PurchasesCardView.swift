//
//  PurchasesCardView.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 14.01.2023.
//

import UIKit

/// View для экрана
public final class PurchasesCardView: UIView {
  
  // MARK: - Public property
  
  public override var intrinsicContentSize: CGSize {
    CGSize(width: Appearance().widthCard, height: UIView.noIntrinsicMetric)
  }
  
  public override class var layerClass: AnyClass {
    return CAGradientLayer.self
  }
  
  // MARK: - Private property
  
  private let containerView = UIView()
  private let headerTitleLabel = UILabel()
  private let titleLabel = UILabel()
  private let descriptionLabel = UILabel()
  private let amountLabel = UILabel()
  private var action: (() -> Void)?
  private let impactFeedback = UIImpactFeedbackGenerator(style: .light)
  
  // MARK: - Initialization
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configureLayout()
    applyDefaultBehavior()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    
    guard let action else {
      return
    }
    impactFeedback.impactOccurred()
    action()
    self.zoomInWithEasing()
  }
  
  // MARK: - Public func
  
  /// Настраиваем Вью
  /// - Parameters:
  ///  - header: Тайтл в заголовке
  ///  - title: Тайтл
  ///  - description: Описание
  ///  - amount: Сумма
  ///  - isSelected: Выьрана карточка
  ///  - action: экшен
  public func configureWith(header: String?,
                            title: String?,
                            description: String?,
                            amount: String?,
                            isSelected: Bool,
                            action: (() -> Void)?) {
    self.action = action
    headerTitleLabel.text = header
    titleLabel.text = title
    descriptionLabel.text = description
    amountLabel.text = amount
    setIsSelected(isSelected)
  }
  
  /// Устатовить состояние карточки
  /// - Parameter isSelected: Карточка выбрана
  public func setIsSelected(_ isSelected: Bool) {
    let appearance = Appearance()
    
    headerTitleLabel.isHidden = !isSelected
    
    if isSelected {
      layer.borderColor = RandomColor.primaryGray.cgColor
      layer.borderWidth = appearance.borderWidth
      
      containerView.backgroundColor = RandomColor.primaryGray
      
      applyGradient(colors: [RandomColor.primaryGreen,
                             RandomColor.secondaryGreen])
      
      titleLabel.textColor = RandomColor.primaryWhite
      descriptionLabel.textColor = RandomColor.primaryWhite
      amountLabel.textColor = RandomColor.primaryWhite
    } else {
      containerView.backgroundColor = .clear
      layer.borderWidth = .zero
      
      applyGradient(colors: [RandomColor.primaryWhite,
                             RandomColor.primaryWhite])
      
      titleLabel.textColor = RandomColor.secondaryGray
      descriptionLabel.textColor = RandomColor.secondaryGray
      amountLabel.textColor = RandomColor.secondaryGray
    }
  }
}

// MARK: - Appearance

private extension PurchasesCardView {
  func configureLayout() {
    let appearance = Appearance()
    
    [headerTitleLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      containerView.addSubview($0)
    }
    
    [containerView, titleLabel, descriptionLabel, amountLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      heightAnchor.constraint(equalToConstant: appearance.heightCard),
      containerView.heightAnchor.constraint(equalToConstant: appearance.containerHeight),
      
      containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
      containerView.topAnchor.constraint(equalTo: topAnchor),
      containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
      
      headerTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
      headerTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
      headerTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
      headerTitleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
      
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
      titleLabel.topAnchor.constraint(equalTo: containerView.bottomAnchor,
                                      constant: appearance.minInset),
      titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
      
      descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
      descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
      descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
      
      amountLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
      amountLabel.bottomAnchor.constraint(equalTo: bottomAnchor,
                                          constant: -appearance.midInset),
      amountLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])
  }
  
  func applyDefaultBehavior() {
    let appearance = Appearance()
    
    headerTitleLabel.textAlignment = .center
    headerTitleLabel.font = RandomFont.primaryBold12
    headerTitleLabel.textColor = RandomColor.primaryWhite
    headerTitleLabel.numberOfLines = 1
    
    titleLabel.textAlignment = .center
    titleLabel.font = RandomFont.primaryMedium48
    titleLabel.textColor = RandomColor.primaryGray
    titleLabel.numberOfLines = 1
    
    descriptionLabel.textAlignment = .center
    descriptionLabel.font = RandomFont.primaryMedium18
    descriptionLabel.textColor = RandomColor.primaryGray
    descriptionLabel.numberOfLines = 1
    
    amountLabel.textAlignment = .center
    amountLabel.font = RandomFont.primaryBold24
    amountLabel.textColor = RandomColor.primaryGray
    amountLabel.numberOfLines = 1
    
    clipsToBounds = true
    layer.cornerRadius = appearance.cornerRadius
  }
  
  private func applyGradient(colors: [UIColor], alpha: CGFloat = 1) {
    guard let gradientLayer = layer as? CAGradientLayer else { return }
    gradientLayer.colors = colors.map { $0.withAlphaComponent(alpha).cgColor }
  }
}

// MARK: - Appearance

private extension PurchasesCardView {
  struct Appearance {
    let cornerRadius: CGFloat = 16
    let borderWidth: CGFloat = 1
    let heightCard: CGFloat = 194
    let widthCard: CGFloat = 129
    let minInset: CGFloat = 4
    let midInset: CGFloat = 16
    let containerHeight: CGFloat = 40
  }
}
