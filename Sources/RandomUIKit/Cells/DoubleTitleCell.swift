//
//  DoubleTitleCell.swift
//
//  Created by Tatiana Sosina on 22.05.2022.
//

import UIKit

// MARK: - DoubleTitleCell

public final class DoubleTitleCell: UITableViewCell {
  
  // MARK: - Public property
  
  /// Identifier для ячейки
  public static let reuseIdentifier = DoubleTitleCell.description()
  
  // MARK: - Private property
  
  private let primaryLable = UILabel()
  private let secondaryLabel = UILabel()
  
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
  ///  - primaryText: Первичный текст
  ///  - secondaryText: Вторичный текст
  public func configureCellWith(primaryText: String?, secondaryText: String?) {
    primaryLable.text = primaryText
    secondaryLabel.text = secondaryText
  }
  
  // MARK: - Private func
  
  private func configureLayout() {
    let appearance = Appearance()
    
    [primaryLable, secondaryLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    NSLayoutConstraint.activate([
      primaryLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                            constant: appearance.insets.left),
      primaryLable.topAnchor.constraint(equalTo: contentView.topAnchor,
                                        constant: appearance.insets.top),
      primaryLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                           constant: -appearance.insets.bottom),
      
      secondaryLabel.leadingAnchor.constraint(equalTo: primaryLable.trailingAnchor),
      secondaryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                               constant: -appearance.insets.right),
      secondaryLabel.topAnchor.constraint(equalTo: contentView.topAnchor,
                                          constant: appearance.insets.top),
      secondaryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                             constant: -appearance.insets.bottom)
    ])
  }
  
  private func applyDefaultBehavior() {
    backgroundColor = RandomColor.primaryWhite
    selectionStyle = .none
    
    secondaryLabel.font = RandomFont.primaryRegular18
    secondaryLabel.textColor = RandomColor.primaryGray
    secondaryLabel.textAlignment = .right
    secondaryLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    
    primaryLable.font = RandomFont.primaryRegular18
    primaryLable.textColor = RandomColor.primaryGray
    primaryLable.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
  }
}

// MARK: - Appearance

private extension DoubleTitleCell {
  struct Appearance {
    let insets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
  }
}
