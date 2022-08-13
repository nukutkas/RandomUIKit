//
//  PlayerView.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 12.08.2022.
//

import UIKit

/// View для экрана
public final class PlayerView: UIView {
  
  /// Стиль карточки
  public enum StyleCard {
    
    /// Стиль выбранной ячейки
    case selected
    
    /// Стиль по умолчанию
    case defaultStyle
    
    /// Настраиваемый стиль
    case customStyle(UIColor?)
    
    /// Цвет фона карточки
    var backgroundColor: UIColor? {
      switch self {
      case .selected:
        return RandomColor.tertiaryGreen
      case .defaultStyle:
        return RandomColor.tertiaryGray
      case .customStyle(let color):
        return color
      }
    }
  }
  
  /// Смайлики на карточке
  public enum StyleEmoji {
    
    /// Буз смайла
    case none
    
    /// Футбольный мяч
    case ball
    
    /// Лайк
    case like
    
    /// Звезда
    case star
    
    /// Настраиваемый стиль
    case customEmoji(Character?)
    
    var emoji: Character? {
      switch self {
      case .none:
        return nil
      case .ball:
        return "⚽️"
      case .like:
        return "👍"
      case .star:
        return "⭐️"
      case .customEmoji(let emoji):
        return emoji
      }
    }
  }
  
  // MARK: - Public properties
  
  public override class var layerClass: AnyClass {
    return CAGradientLayer.self
  }
  
  // MARK: - Private properties
  
  private let avatarImageView = UIImageView()
  private let emojiLabel = UILabel()
  private let nameLabel = UILabel()
  
  private var emojiAction: (() -> Void)?
  private var cardAction: (() -> Void)?
  
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
  
  // MARK: - Public func
  
  /// Настраиваем ячейку
  /// - Parameters:
  ///  - avatar: Аватарка
  ///  - name: Имя
  ///  - nameTextColor: Цвет имени
  ///  - styleCard: Стиль карточки
  ///  - styleEmoji: Стиль смайликов
  ///  - isBorder: Включить границу у карточки
  ///  - isShadow: Включить тень у карточки
  ///  - emojiAction: Действие по нажатию на смайл
  ///  - cardAction: Действие по нажатию на карточку
  public func configureWith(avatar: UIImage?,
                            name: String?,
                            nameTextColor: UIColor = RandomColor.primaryGray,
                            styleCard: StyleCard,
                            styleEmoji: StyleEmoji = .none,
                            isBorder: Bool,
                            isShadow: Bool,
                            emojiAction: (() -> Void)? = nil,
                            cardAction: (() -> Void)? = nil) {
    let appearance = Appearance()
    backgroundColor = styleCard.backgroundColor
    nameLabel.text = name
    nameLabel.textColor = nameTextColor
    avatarImageView.image = avatar
    self.emojiAction = emojiAction
    self.cardAction = cardAction
    
    if let emoji = styleEmoji.emoji {
      emojiLabel.text = String(emoji)
    }
    
    if isBorder {
      layer.borderColor = RandomColor.primaryBlack.cgColor
      layer.borderWidth = Appearance().borderWidth
    }
    
    if isShadow {
      layer.shadowColor = RandomColor.primaryGray.cgColor
      layer.shadowRadius = appearance.shadowRadius
      layer.shadowOpacity = appearance.shadowOpacity
    }
    clipsToBounds = !isShadow
  }
  
  // MARK: - Private func
  
  private func configureLayout() {
    let appearance = Appearance()
    
    [avatarImageView, emojiLabel, nameLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      heightAnchor.constraint(equalToConstant: appearance.cardSize.height),
      widthAnchor.constraint(equalToConstant: appearance.cardSize.width),
      
      avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
      avatarImageView.topAnchor.constraint(equalTo: topAnchor),
      avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
      avatarImageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor,
                                              constant: -appearance.minInsets),
      
      emojiLabel.topAnchor.constraint(equalTo: topAnchor,
                                      constant: appearance.minInsets),
      emojiLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                           constant: -appearance.minInsets),
      
      nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                         constant: appearance.middleInsets),
      nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor,
                                        constant: -appearance.middleInsets),
      nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                          constant: -appearance.middleInsets),
    ])
  }
  
  private func applyDefaultBehavior() {
    let appearance = Appearance()
    backgroundColor = RandomColor.primaryWhite
    layer.cornerRadius = appearance.cornerRadius
    
    emojiLabel.font = RandomFont.primaryMedium18
    
    nameLabel.font = RandomFont.primaryBold10
    nameLabel.textColor = RandomColor.primaryGray
    nameLabel.numberOfLines = appearance.numberOfLines
    nameLabel.textAlignment = .center
    
    avatarImageView.contentMode = .scaleAspectFit
    
    let emojiTap = UITapGestureRecognizer(target: self, action: #selector(emojiLabelAction))
    emojiTap.cancelsTouchesInView = false
    emojiLabel.addGestureRecognizer(emojiTap)
    emojiLabel.isUserInteractionEnabled = true
    
    let cardTap = UITapGestureRecognizer(target: self, action: #selector(cardViewAction))
    cardTap.cancelsTouchesInView = false
    addGestureRecognizer(cardTap)
    isUserInteractionEnabled = true
  }
  
  @objc
  private func emojiLabelAction() {
    guard emojiAction != nil else {
      return
    }
    
    emojiAction?()
    impactFeedback.impactOccurred()
  }
  
  @objc
  private func cardViewAction() {
    guard cardAction != nil else {
      return
    }
    
    cardAction?()
    impactFeedback.impactOccurred()
  }
}

// MARK: - Appearance

private extension PlayerView {
  struct Appearance {
    let cornerRadius: CGFloat = 16
    let cardSize = CGSize(width: 90, height: 100)
    let borderWidth: CGFloat = 1
    let shadowRadius: CGFloat = 4
    let shadowOpacity: Float = 0.2
    let minInsets: CGFloat = 4
    let middleInsets: CGFloat = 8
    let numberOfLines = 2
  }
}
