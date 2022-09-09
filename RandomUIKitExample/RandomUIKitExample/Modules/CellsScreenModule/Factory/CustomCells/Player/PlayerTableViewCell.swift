//
//  PlayerTableViewCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 12.08.2022.
//

import UIKit
import RandomUIKit

// MARK: - PlayerTableViewCell

final class PlayerTableViewCell: UITableViewCell {
  
  // MARK: - Private properties
  
  private let playerView = PlayerView()
  private let titleLabel = UILabel()
  
  // MARK: - Initilisation
  
  public override init(style: CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    configureLayout()
    applyDefaultBehavior()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError()
  }
  
  // MARK: - Public func
  
  /// Настраиваем ячейку
  /// - Parameters:
  ///  - titleCell: Заголовок для ячейки
  ///  - avatar: Аватарка
  ///  - name: Имя
  ///  - nameTextColor: Цвет имени
  ///  - styleCard: Стиль карточки
  ///  - styleEmoji: Стиль смайликов
  ///  - isBorder: Включить границу у карточки
  ///  - isShadow: Включить тень у карточки
  ///  - emojiAction: Действие по нажатию на смайл
  ///  - cardAction: Действие по нажатию на карточку
  public func configureCellWith(titleCell: String?,
                                avatar: UIImage?,
                                name: String?,
                                nameTextColor: UIColor = RandomColor.darkApple,
                                styleCard: PlayerView.StyleCard,
                                styleEmoji: PlayerView.StyleEmoji = .none,
                                isBorder: Bool,
                                isShadow: Bool,
                                emojiAction: (() -> Void)? = nil,
                                cardAction: (() -> Void)? = nil) {
    titleLabel.text = titleCell
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
    let appearance = Appearance()
    
    [playerView, titleLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: appearance.insets.top),
      titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      
      playerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                      constant: appearance.insets.top),
      playerView.centerXAnchor.constraint(equalTo: centerXAnchor),
      playerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                         constant: -appearance.insets.bottom)
    ])
  }
  
  private func applyDefaultBehavior() {
    backgroundColor = RandomColor.primaryWhite
    selectionStyle = .none
    
    titleLabel.textColor = .black
  }
}

// MARK: - Appearance

private extension PlayerTableViewCell {
  struct Appearance {
    let insets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
  }
}
