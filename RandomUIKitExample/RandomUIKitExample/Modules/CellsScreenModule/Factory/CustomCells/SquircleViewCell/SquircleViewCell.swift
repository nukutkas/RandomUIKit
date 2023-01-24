//
//  SquircleViewCell.swift
//  RandomUIKitExample
//
//  Created by SOSIN Vitaly on 24.01.2023.
//

import UIKit
import RandomUIKit

// MARK: - SquircleViewCell

final class SquircleViewCell: UITableViewCell {

  // MARK: - Private properties

  private let squircleView = SquircleView(borderWidth: .zero, borderColor: .clear)
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
  public func configureCellWith(titleCell: String?) {
    titleLabel.text = titleCell
    squircleView.applyGradient(colors: [RandomColor.primaryGreen, RandomColor.primaryGray])
  }

  // MARK: - Private func

  private func configureLayout() {
    let appearance = Appearance()

    [squircleView, titleLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }

    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor,
                                      constant: appearance.defaultInsets),
      titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

      squircleView.heightAnchor.constraint(equalToConstant: appearance.defaultSize),
      squircleView.widthAnchor.constraint(equalToConstant: appearance.defaultSize),
      squircleView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                        constant: appearance.defaultInsets),
      squircleView.centerXAnchor.constraint(equalTo: centerXAnchor),
      squircleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                           constant: -appearance.defaultInsets)
    ])
  }

  private func applyDefaultBehavior() {
    backgroundColor = RandomColor.primaryWhite
    selectionStyle = .none

    titleLabel.textColor = .black
  }
}

// MARK: - Appearance

private extension SquircleViewCell {
  struct Appearance {
    let defaultInsets: CGFloat = 16
    let defaultSize: CGFloat = 100
  }
}

