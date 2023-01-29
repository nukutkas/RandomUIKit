//
//  FilmViewCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 29.01.2023.
//

import UIKit
import RandomUIKit

// MARK: - PlayerTableViewCell

final class FilmViewCell: UITableViewCell {
  
  // MARK: - Private properties
  
  private let filmView = FilmView()
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
  ///  - backgroundImage: Фоновое изображение
  ///  - titleCell: Заголовок для ячейки
  ///  - title: Заголовок
  ///  - description: Описание
  ///  - buttonTitle: Название кнопки
  ///  - buttonAction: Действие на кнопку
  public func configureCellWith(backgroundImage: UIImage?,
                                titleCell: String?,
                                title: String?,
                                description: String?,
                                buttonTitle: String?,
                                buttonAction: (() -> Void)?) {
    titleLabel.text = titleCell
    filmView.configureWith(backgroundImage: backgroundImage,
                           title: title,
                           description: description,
                           buttonTitle: buttonTitle,
                           buttonAction: buttonAction)
  }
  
  // MARK: - Private func
  
  private func configureLayout() {
    let appearance = Appearance()
    
    [filmView, titleLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: appearance.insets.top),
      titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      filmView.heightAnchor.constraint(equalToConstant: appearance.filmViewHeight),
      
      filmView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                    constant: appearance.insets.top),
      filmView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      filmView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      filmView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }
  
  private func applyDefaultBehavior() {
    backgroundColor = RandomColor.darkAndLightTheme.primaryWhite
    selectionStyle = .none
    
    titleLabel.textColor = .black
  }
}

// MARK: - Appearance

private extension FilmViewCell {
  struct Appearance {
    let insets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    let filmViewHeight: CGFloat = UIScreen.main.bounds.height
  }
}

