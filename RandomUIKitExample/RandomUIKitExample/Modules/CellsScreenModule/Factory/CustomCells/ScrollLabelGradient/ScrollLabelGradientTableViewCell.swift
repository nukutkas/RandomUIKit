//
//  ScrollLabelGradientTableViewCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit
import RandomUIKit

// MARK: - ScrollLabelGradientTableViewCell

final class ScrollLabelGradientTableViewCell: UITableViewCell {
  
  // MARK: - Private properties
  
  private let scrollLabelGradientView = ScrollLabelGradientView()
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
  ///  - listLabels: Массив элементов для отображения в формате `String`
  public func configureCellWith(titleCell: String?, listLabels: [String?]) {
    titleLabel.text = titleCell
    scrollLabelGradientView.listLabels = listLabels
  }
  
  // MARK: - Private func
  
  private func configureLayout() {
    let appearance = Appearance()
    
    [scrollLabelGradientView, titleLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor,
                                      constant: appearance.insets.top),
      titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      
      scrollLabelGradientView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                                   constant: appearance.insets.top),
      scrollLabelGradientView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      scrollLabelGradientView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      scrollLabelGradientView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                      constant: -appearance.insets.bottom)
    ])
    
  }
  
  private func applyDefaultBehavior() {
    backgroundColor = RandomColor.darkAndLightTheme.primaryWhite
    selectionStyle = .none
    
    titleLabel.textColor = .black
  }
}

// MARK: - Appearance

private extension ScrollLabelGradientTableViewCell {
  struct Appearance {
    let insets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
  }
}
