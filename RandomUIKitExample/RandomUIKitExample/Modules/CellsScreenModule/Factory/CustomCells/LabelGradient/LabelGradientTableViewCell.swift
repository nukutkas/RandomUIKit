//
//  LabelGradientTableViewCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit
import RandomUIKit

// MARK: - LabelGradientTableViewCell

final class LabelGradientTableViewCell: UITableViewCell {
  
  // MARK: - Private properties
  
  private let labelGradientView = LabelGradientView()
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
  ///  - titleText: Заголовок на рекламном лайбле
  ///  - font: Шрифт на рекламном лайбле
  ///  - textColor: Цвет рекламного лейбла
  ///  - borderWidth: Ширина границы компонента
  ///  - borderColor: Цвет границы компонента
  ///  - gradientDVLabel: Градиент цветов для рекламного лайбла
  public func configureCellWith(titleCell: String?,
                                titleText: String?,
                                font: UIFont? = nil,
                                textColor: UIColor? = nil,
                                borderWidth: CGFloat? = nil,
                                borderColor: UIColor? = nil,
                                gradientDVLabel: [UIColor]) {
    titleLabel.text = titleCell
    labelGradientView.configureWith(
      titleText: titleText,
      font: font,
      textColor: textColor,
      borderWidth: borderWidth,
      borderColor: borderColor,
      gradientDVLabel: gradientDVLabel
    )
  }
  
  // MARK: - Private func
  
  private func configureLayout() {
    let appearance = Appearance()
    
    [labelGradientView, titleLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: appearance.insets),
      titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      
      labelGradientView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: appearance.insets),
      labelGradientView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      labelGradientView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -appearance.insets)
    ])
    
  }
  
  private func applyDefaultBehavior() {
    backgroundColor = RandomColor.darkAndLightTheme.primaryWhite
    selectionStyle = .none
    
    titleLabel.textColor = .black
  }
}

// MARK: - Appearance

private extension LabelGradientTableViewCell {
  struct Appearance {
    let insets: CGFloat = 16
  }
}
