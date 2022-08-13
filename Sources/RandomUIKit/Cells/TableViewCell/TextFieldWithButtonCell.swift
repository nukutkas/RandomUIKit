//
//  TextFieldWithButtonCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 13.08.2022.
//

import UIKit

// MARK: - TextFieldWithButtonCell

public final class TextFieldWithButtonCell: UITableViewCell {
  
  // MARK: - Public property
  
  /// Identifier для ячейки
  public static let reuseIdentifier = TextFieldWithButtonCell.description()
  
  // MARK: - Private property
  
  private var textField: TextFieldView?
  private let button = UIButton()
  private var buttonAction: (() -> Void)?
  private let impactFeedback = UIImpactFeedbackGenerator(style: .light)
  
  // MARK: - Initilisation
  
  public override init(style: CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    applyDefaultBehavior()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError()
  }
  
  // MARK: - Public func
  
  /// Настраиваем ячейку
  /// - Parameters:
  ///  - textField: Текстовое поле
  ///  - buttonImageSystemName: Название системной иконки
  ///  - buttonImageColor: Цвет изображения кнопки
  ///  - buttonAction: Действие по нажатию на кнопку
  public func configureCellWith(textField: TextFieldView,
                                buttonImageSystemName: String?,
                                buttonImageColor: UIColor? = RandomColor.primaryGreen,
                                buttonAction: (() -> Void)? = nil) {
    self.textField = textField
    self.buttonAction = buttonAction
    
    if let buttonImageColor = buttonImageColor {
      button.imageView?.setImageColor(color: buttonImageColor)
    }
    
    if #available(iOS 13, *) {
      let largeConfig = UIImage.SymbolConfiguration(pointSize: Appearance().pointSize,
                                                    weight: .bold,
                                                    scale: .large)
      button.setImage(UIImage(systemName: buttonImageSystemName ?? "",
                              withConfiguration: largeConfig), for: .normal)
    }
    configureLayout(textField: textField)
  }
  
  // MARK: - Private func
  
  private func configureLayout(textField: TextFieldView) {
    let appearance = Appearance()
    
    [textField, button].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      button.widthAnchor.constraint(equalToConstant: appearance.buttonSize.width),
      button.heightAnchor.constraint(equalToConstant: appearance.buttonSize.height),
      
      textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                         constant: appearance.insets.left),
      textField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      
      button.leadingAnchor.constraint(equalTo: textField.trailingAnchor),
      button.topAnchor.constraint(equalTo: contentView.topAnchor),
      button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                       constant: -appearance.insets.right),
      button.bottomAnchor.constraint(greaterThanOrEqualTo: contentView.bottomAnchor)
    ])
  }
  
  private func applyDefaultBehavior() {
    backgroundColor = RandomColor.primaryWhite
    selectionStyle = .none
    
    if #available(iOS 13, *) {
      let largeConfig = UIImage.SymbolConfiguration(pointSize: Appearance().pointSize,
                                                    weight: .bold,
                                                    scale: .large)
      button.setImage(UIImage(systemName: "checkmark.circle.fill",
                              withConfiguration: largeConfig), for: .normal)
    }
    
    button.contentMode = .center
    button.imageView?.contentMode = .scaleAspectFit
    button.imageView?.setImageColor(color: RandomColor.primaryGreen)
    button.addTarget(self, action: #selector(buttonTappedAction), for: .touchUpInside)
  }
  
  @objc
  private func buttonTappedAction() {
    guard buttonAction != nil else {
      return
    }
    buttonAction?()
    impactFeedback.impactOccurred()
  }
}

// MARK: - Appearance

private extension TextFieldWithButtonCell {
  struct Appearance {
    let insets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    let buttonSize = CGSize(width: 44, height: 44)
    let pointSize: CGFloat = 20
  }
}
