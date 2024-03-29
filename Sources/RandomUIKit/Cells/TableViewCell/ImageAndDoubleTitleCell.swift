//
//  ImageAndDoubleTitleCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 24.01.2023.
//

import UIKit

// MARK: - ImageAndDoubleTitleCell

public final class ImageAndDoubleTitleCell: UITableViewCell {
  
  // MARK: - Public property
  
  /// Identifier для ячейки
  public static let reuseIdentifier = ImageAndDoubleTitleCell.description()
  
  // MARK: - Private property
  
  private let primaryLable = UILabel()
  private let secondaryLabel = UILabel()
  private let leftSideImageView = UIImageView()
  
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
  ///  - leftSideImage: Картинка слева
  ///  - leftSideImageColor: Цвет картинки слева
  ///  - primaryText: Первичный текст
  ///  - primaryTextColor: Первичный цвет текста
  ///  - primaryTextFont: Первичный шрифт текста
  ///  - secondaryText: Вторичный текст
  ///  - secondaryTextColor: Вторичный цвет текст
  ///  - secondaryTextFont: Вторичный шрифт текст
  public func configureCellWith(leftSideImage: UIImage?,
                                leftSideImageColor: UIColor?,
                                primaryText: String?,
                                primaryTextColor: UIColor = RandomColor.darkAndLightTheme.primaryGray,
                                primaryTextFont: UIFont = RandomFont.primaryRegular18,
                                secondaryText: String?,
                                secondaryTextColor: UIColor = RandomColor.darkAndLightTheme.primaryGray,
                                secondaryTextFont: UIFont = RandomFont.primaryRegular18) {
    primaryLable.text = primaryText
    primaryLable.textColor = primaryTextColor
    primaryLable.font = primaryTextFont
    
    secondaryLabel.text = secondaryText
    secondaryLabel.textColor = secondaryTextColor
    secondaryLabel.font = secondaryTextFont
    leftSideImageView.image = leftSideImage
    leftSideImageView.setImageColor(color: leftSideImageColor ?? RandomColor.darkAndLightTheme.primaryGray)
  }
  
  // MARK: - Private func
  
  private func configureLayout() {
    let appearance = Appearance()
    
    [primaryLable, secondaryLabel, leftSideImageView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    NSLayoutConstraint.activate([
      leftSideImageView.widthAnchor.constraint(equalToConstant: appearance.imageSize),
      leftSideImageView.heightAnchor.constraint(equalToConstant: appearance.imageSize),
      
      leftSideImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                 constant: appearance.insets.left),
      leftSideImageView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                             constant: appearance.insets.top),
      leftSideImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                constant: -appearance.insets.bottom),
      
      primaryLable.leadingAnchor.constraint(equalTo: leftSideImageView.trailingAnchor,
                                            constant: appearance.insets.left),
      primaryLable.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      
      secondaryLabel.leadingAnchor.constraint(equalTo: primaryLable.trailingAnchor),
      secondaryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                               constant: -appearance.insets.right),
      secondaryLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
    ])
  }
  
  private func applyDefaultBehavior() {
    backgroundColor = RandomColor.darkAndLightTheme.primaryWhite
    contentView.backgroundColor = RandomColor.darkAndLightTheme.primaryWhite
    selectionStyle = .none
    
    secondaryLabel.font = RandomFont.primaryRegular18
    secondaryLabel.textColor = RandomColor.darkAndLightTheme.primaryGray
    secondaryLabel.textAlignment = .right
    secondaryLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    
    primaryLable.font = RandomFont.primaryRegular18
    primaryLable.textColor = RandomColor.darkAndLightTheme.primaryGray
    primaryLable.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
  }
}

// MARK: - Appearance

private extension ImageAndDoubleTitleCell {
  struct Appearance {
    let insets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    let imageSize: CGFloat = 24
  }
}

