//
//  LabelAndImageCell.swift
//
//  Created by Tatiana Sosina on 22.05.2022.
//

import UIKit

// MARK: - LabelAndImageCell

public final class LabelAndImageCell: UITableViewCell {
  
  // MARK: - Public property
  
  /// Identifier для ячейки
  public static let reuseIdentifier = LabelAndImageCell.description()
  
  // MARK: - Private property
  
  private let titleLable = UILabel()
  private let imageAsideView = UIImageView()
  private let impactFeedback = UIImpactFeedbackGenerator(style: .light)
  
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
  
  public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    backgroundColor = RandomColor.primaryDivider
  }
  
  public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    backgroundColor = RandomColor.secondaryWhite
    impactFeedback.impactOccurred()
  }
  
  public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesCancelled(touches, with: event)
    backgroundColor = RandomColor.secondaryWhite
  }
  
  /// Настраиваем ячейку
  /// - Parameters:
  ///  - titleText: Заголовок
  ///  - imageAside: Иконка справого края
  public func configureCellWith(titleText: String?, imageAside: UIImage?) {
    titleLable.text = titleText
    imageAsideView.image = imageAside
  }
  
  // MARK: - Private func
  
  private func configureLayout() {
    let appearance = Appearance()
    
    [titleLable, imageAsideView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    NSLayoutConstraint.activate([
      imageAsideView.widthAnchor.constraint(equalToConstant: appearance.imageAsideSize.width),
      imageAsideView.heightAnchor.constraint(equalToConstant: appearance.imageAsideSize.height),
      
      titleLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                          constant: appearance.insets.left),
      titleLable.topAnchor.constraint(equalTo: contentView.topAnchor,
                                      constant: appearance.insets.top),
      titleLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                         constant: -appearance.insets.bottom),
      
      imageAsideView.leadingAnchor.constraint(equalTo: titleLable.trailingAnchor),
      imageAsideView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                               constant: -appearance.insets.right),
      imageAsideView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
    ])
  }
  
  private func applyDefaultBehavior() {
    backgroundColor = RandomColor.secondaryWhite
    selectionStyle = .none
    
    titleLable.font = RandomFont.primaryRegular18
    titleLable.textColor = RandomColor.primaryGray
    
    imageAsideView.setImageColor(color: RandomColor.secondaryGray)
  }
}

// MARK: - Appearance

private extension LabelAndImageCell {
  struct Appearance {
    let insets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    let imageAsideSize = CGSize(width: 24, height: 24)
  }
}
