//
//  TextFieldTableViewCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit
import RandomUIKit

// MARK: - TextFieldTableViewCell

final class TextFieldTableViewCell: UITableViewCell {
  
  // MARK: - Private properties
  
  private let textFieldView = TextFieldView()
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
  ///  - titlePlaceholder: Плейсхолдер для поля ввода
  public func configureCellWith(titleCell: String?,
                                titlePlaceholder: String?) {
    titleLabel.text = titleCell
    textFieldView.placeholder = titlePlaceholder
  }
  
  // MARK: - Private func
  
  private func configureLayout() {
    let appearance = Appearance()
    
    [textFieldView, titleLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor,
                                      constant: appearance.insets.top),
      titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      
      textFieldView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                         constant: appearance.insets.top),
      textFieldView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                             constant: appearance.insets.left),
      textFieldView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                              constant: -appearance.insets.right),
      textFieldView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
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

private extension TextFieldTableViewCell {
  struct Appearance {
    let insets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
  }
}
