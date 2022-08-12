//
//  CustomTexCollectiontCell.swift
//  
//
//  Created by Vitalii Sosin on 13.08.2022.
//

import UIKit

// MARK: - CustomTexCollectiontCell

public final class CustomTexCollectiontCell: UICollectionReusableView {
  
  // MARK: - Public property
  
  /// Identifier для ячейки
  public static let reuseIdentifier = CustomTextCell.description()
  
  // MARK: - Private property
  
  private let titleLabel = UILabel()
  
  // MARK: - Initilisation
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    
    configureLayout()
    applyDefaultBehavior()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    fatalError()
  }
  
  // MARK: - Public func
  
  /// Настраиваем ячейку
  /// - Parameters:
  ///  - titleText: Текст заголовка
  ///  - textColor: Цвет текста
  ///  - textFont: Шрифт текста
  ///  - textAlignment: Выравнивание текста
  public func configureCellWith(titleText: String?,
                                textColor: UIColor?,
                                textFont: UIFont? = RandomFont.primaryRegular18,
                                textAlignment: NSTextAlignment) {
    titleLabel.text = titleText
    titleLabel.textColor = textColor
    titleLabel.font = textFont
    titleLabel.textAlignment = textAlignment
  }
  
  // MARK: - Private func
  
  private func configureLayout() {
    let appearance = Appearance()
    
    [titleLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      addSubview($0)
    }
    NSLayoutConstraint.activate([
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                          constant: appearance.insets.left),
      titleLabel.topAnchor.constraint(equalTo: topAnchor,
                                      constant: appearance.insets.top),
      titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                           constant: -appearance.insets.right),
      titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor,
                                         constant: -appearance.insets.bottom)
    ])
  }
  
  private func applyDefaultBehavior() {
    backgroundColor = RandomColor.primaryWhite
    
    titleLabel.font = RandomFont.primaryRegular18
    titleLabel.textColor = RandomColor.primaryGray
    titleLabel.textAlignment = .center
  }
}

// MARK: - Appearance

private extension CustomTexCollectiontCell {
  struct Appearance {
    let insets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
  }
}
