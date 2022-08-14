//
//  PlayerCollectionViewCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 12.08.2022.
//

import UIKit

/// Ячейка с игроком
public final class PlayerCollectionViewCell: UICollectionViewCell {
  
  // MARK: - Public properties
  
  public static let reuseIdentifier = PlayerCollectionViewCell.description()
  
  // MARK: - Private properties
  
  private let playerView = PlayerView()
  
  // MARK: - Initialization
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    
    configureLayout()
    applyDefaultBehavior()
  }
  
  public required init?(coder: NSCoder) {
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
  public func configureCellWith(avatar: UIImage?,
                                name: String?,
                                nameTextColor: UIColor = RandomColor.primaryGray,
                                styleCard: PlayerView.StyleCard,
                                styleEmoji: PlayerView.StyleEmoji = .none,
                                isBorder: Bool,
                                isShadow: Bool,
                                emojiAction: (() -> Void)? = nil,
                                cardAction: (() -> Void)? = nil) {
    playerView.configureWith(
      avatar: avatar,
      name: name,
      nameTextColor: nameTextColor,
      styleCard: styleCard,
      styleEmoji: styleEmoji,
      isBorder: isBorder,
      isShadow: isShadow,
      emojiAction: emojiAction,
      cardAction: cardAction
    )
  }
  
  // MARK: - Private func
  
  private func configureLayout() {
    [playerView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      playerView.topAnchor.constraint(equalTo: contentView.topAnchor),
      playerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      playerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      playerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
    ])
  }
  
  private func applyDefaultBehavior() {
    backgroundColor = RandomColor.primaryWhite
    contentView.backgroundColor = RandomColor.primaryWhite
  }
}

// MARK: - Appearance

private extension PlayerCollectionViewCell {
  struct Appearance {}
}
