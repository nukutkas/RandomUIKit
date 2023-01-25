//
//  ColorsScreenViewCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit
import RandomUIKit

/// ViewCell для экрана
final class ColorsScreenViewCell: UITableViewCell {
  
  // MARK: - Internal properties
  
  static let cellIdentifier = ColorsScreenViewCell.description()
  
  // MARK: - Private properties
  private let colorView = UIView()
  private let titleLabel = UILabel()
  
  // MARK: - Initialization
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    configureLayout()
    applyDefaultBehavior()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Internal func
  
  func configure(titleText: String, color: UIColor) {
    colorView.backgroundColor = color
    titleLabel.text = titleText
  }
  
  // MARK: - Private func
  
  private func configureLayout() {
    let appearance = Appearance()
    
    [colorView, titleLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    
    contentView.removeConstraints(contentView.constraints)
    let heightConstraint = colorView.heightAnchor.constraint(equalToConstant: appearance.colorViewSize.height)
    heightConstraint.priority = .defaultHigh
    NSLayoutConstraint.activate([
      colorView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: appearance.colorInsets.top),
      colorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: appearance.colorInsets.left),
      colorView.widthAnchor.constraint(equalToConstant: appearance.colorViewSize.width),
      heightConstraint,
      colorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -appearance.colorInsets.bottom),
      
      titleLabel.leadingAnchor.constraint(equalTo: colorView.trailingAnchor, constant: appearance.titleInsets.left),
      titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
    ])
  }
  
  private func applyDefaultBehavior() {
    let appearance = Appearance()
    
    backgroundColor = RandomColor.darkAndLightTheme.primaryWhite
    contentView.backgroundColor = RandomColor.darkAndLightTheme.primaryWhite
    selectionStyle = .none
    
    titleLabel.textAlignment = .left
    titleLabel.lineBreakMode = .byTruncatingTail
    
    colorView.layer.cornerRadius = appearance.cornerRadius
    colorView.layer.borderColor = RandomColor.darkAndLightTheme.primaryBlack.cgColor
    colorView.layer.borderWidth = appearance.borderWidth
  }
}

// MARK: - Appearance

private extension ColorsScreenViewCell {
  struct Appearance {
    let colorInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    let titleInsets = UIEdgeInsets(top: 22, left: 16, bottom: 22, right: 16)
    let colorViewSize = CGSize(width: 100, height: 100)
    let cornerRadius: CGFloat = 14
    let borderWidth: CGFloat = 0.5
  }
}
