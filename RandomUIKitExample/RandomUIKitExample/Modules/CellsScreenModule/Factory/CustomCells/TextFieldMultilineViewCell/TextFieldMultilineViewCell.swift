//
//  TextFieldMultilineViewCell.swift
//  RandomUIKitExample
//
//  Created by Никита Кочетов on 25.02.2023.
//

import UIKit
import RandomUIKit

// MARK: - PlayerTableViewCell

final class TextFieldMultilineViewCell: UITableViewCell {

  // MARK: - Private properties

  private let textfFieldMultilineView = TextFieldMultilineView()
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
  public func configureCellWith(titleCell: String?, titlePlaceholder: String?) {
    titleLabel.text = titleCell
    textfFieldMultilineView.text = titlePlaceholder
  }

  // MARK: - Private func

  private func configureLayout() {
    let appearance = Appearance()

    [textfFieldMultilineView, titleLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }

    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor,
                                      constant: appearance.insets.top),
      titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

      textfFieldMultilineView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                                   constant: appearance.insets.top),
      textfFieldMultilineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                       constant: appearance.insets.left),
      textfFieldMultilineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                        constant: -appearance.insets.right),
      textfFieldMultilineView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                      constant: -appearance.insets.bottom)
    ])
  }

  private func applyDefaultBehavior() {
    backgroundColor = RandomColor.darkAndLightTheme.primaryWhite
    selectionStyle = .none

    titleLabel.textColor = .black

    textfFieldMultilineView.isScrollEnabled = false
    textfFieldMultilineView.sizeToFit()
  }
}

// MARK: - Appearance

private extension TextFieldMultilineViewCell {
  struct Appearance {
    let insets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
  }
}
