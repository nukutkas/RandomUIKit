//
//  PlayerInfoTableViewCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 13.08.2022.
//

import UIKit

// MARK: - PlayerInfoTableViewCell

public final class PlayerInfoTableViewCell: UITableViewCell {
  
  /// Identifier для ячейки
  public static let reuseIdentifier = PlayerInfoTableViewCell.description()
  
  // MARK: - Private property
  
  private let avatarImageView = UIImageView()
  private let namePlayerLabel = UILabel()
  private let nameTeamLabel = UILabel()
  private let stackView = UIStackView()
  private let emojiLabel = UILabel()
  
  private var emojiAction: (() -> Void)?
  private var contentAction: (() -> Void)?
  
  private let impactFeedback = UIImpactFeedbackGenerator(style: .light)
  
  // MARK: - Initilisation
  
  public override init(style: CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    configureLayout()
    applyDefaultBehavior()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError()
  }
  
  public override func prepareForReuse() {
    super.prepareForReuse()
    layer.cornerRadius = .zero
  }
  
  // MARK: - Public func
  
  /// Настраиваем ячейку
  /// - Parameters:
  ///  - avatar: Аватарка
  ///  - namePlayer: Имя игрока
  ///  - namePlayerColor: Цвет имени игрока
  ///  - namePlayerFont: Шрифт имени игрока
  ///  - nameTeam: Имя команды
  ///  - nameTeamColor: Цвет имени команды
  ///  - nameTeamFont: Шрифт имени команды
  ///  - emoji: Смайлик
  ///  - emojiAction: Действие по нажатию на смайл
  ///  - contentAction: Действие по нажатию на контент
  public func configureCellWith(avatar: UIImage?,
                                namePlayer: String?,
                                namePlayerColor: UIColor = RandomColor.primaryGray,
                                namePlayerFont: UIFont = RandomFont.primaryMedium18,
                                nameTeam: String?,
                                nameTeamColor: UIColor = RandomColor.primaryBlue,
                                nameTeamFont: UIFont = RandomFont.primaryRegular16,
                                emoji: Character? = "⚪️",
                                emojiAction: (() -> Void)? = nil,
                                contentAction: (() -> Void)? = nil) {
    avatarImageView.image = avatar
    
    namePlayerLabel.text = namePlayer
    namePlayerLabel.textColor = namePlayerColor
    namePlayerLabel.font = namePlayerFont
    
    nameTeamLabel.text = nameTeam
    nameTeamLabel.textColor = nameTeamColor
    nameTeamLabel.font = nameTeamFont
    
    self.emojiAction = emojiAction
    self.contentAction = contentAction
    
    if let emoji = emoji {
      emojiLabel.text = String(emoji)
    }
  }
  
  // MARK: - Private func
  
  private func configureLayout() {
    let appearance = Appearance()
    
    [namePlayerLabel, nameTeamLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      stackView.addArrangedSubview($0)
    }
    
    [avatarImageView, stackView, emojiLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      avatarImageView.widthAnchor.constraint(equalToConstant: appearance.avatarImageSize.width),
      avatarImageView.heightAnchor.constraint(equalToConstant: appearance.avatarImageSize.height),
      
      avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                               constant: appearance.insets.left),
      avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                           constant: appearance.insets.top),
      avatarImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                              constant: -appearance.insets.bottom),
      
      stackView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor,
                                         constant: appearance.insets.left),
      stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      
      emojiLabel.leadingAnchor.constraint(greaterThanOrEqualTo: stackView.trailingAnchor,
                                          constant: appearance.insets.left),
      emojiLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      emojiLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                           constant: -appearance.insets.right)
    ])
  }
  
  private func applyDefaultBehavior() {
    let appearance = Appearance()
    backgroundColor = RandomColor.primaryWhite
    contentView.backgroundColor = RandomColor.primaryWhite
    selectionStyle = .none
    
    avatarImageView.contentMode = .scaleAspectFit
    
    namePlayerLabel.font = RandomFont.primaryMedium18
    namePlayerLabel.textColor = RandomColor.primaryGray
    namePlayerLabel.numberOfLines = appearance.numberOfLines
    namePlayerLabel.textAlignment = .left
    
    nameTeamLabel.font = RandomFont.primaryRegular16
    nameTeamLabel.textColor = RandomColor.primaryBlue
    nameTeamLabel.numberOfLines = appearance.numberOfLines
    nameTeamLabel.textAlignment = .left
    
    emojiLabel.font = RandomFont.primaryMedium18
    emojiLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    
    stackView.axis = .vertical
    stackView.spacing = 4
    stackView.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
    
    let emojiTap = UITapGestureRecognizer(target: self, action: #selector(emojiLabelAction))
    emojiTap.cancelsTouchesInView = false
    emojiLabel.addGestureRecognizer(emojiTap)
    emojiLabel.isUserInteractionEnabled = true
    
    let contentTap = UITapGestureRecognizer(target: self, action: #selector(contentViewAction))
    contentTap.cancelsTouchesInView = false
    contentView.addGestureRecognizer(contentTap)
    contentView.isUserInteractionEnabled = true
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
  private func contentViewAction() {
    guard contentAction != nil else {
      return
    }
    
    contentAction?()
    impactFeedback.impactOccurred()
  }
}

// MARK: - Appearance

private extension PlayerInfoTableViewCell {
  struct Appearance {
    let insets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    let avatarImageSize = CGSize(width: 60, height: 60)
    let numberOfLines = 1
  }
}
