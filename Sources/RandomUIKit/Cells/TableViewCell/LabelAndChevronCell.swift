//
//  LabelAndChevronCell.swift
//
//  Created by Tatiana Sosina on 22.05.2022.
//

import UIKit

// MARK: - LabelAndChevronCell

public final class LabelAndChevronCell: UITableViewCell {
  
  // MARK: - Public property
  
  /// Identifier для ячейки
  public static let reuseIdentifier = LabelAndChevronCell.description()
  
  // MARK: - Private property
  
  private let titleLable = UILabel()
  private let chevronImageView = UIImageView()
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
  
  public override func prepareForReuse() {
    super.prepareForReuse()
    layer.cornerRadius = .zero
  }
  
  // MARK: - Public func
  
  public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    backgroundColor = RandomColor.darkAndLightTheme.secondaryGray.withAlphaComponent(0.1)
    contentView.backgroundColor = RandomColor.darkAndLightTheme.secondaryGray.withAlphaComponent(0.1)
  }
  
  public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    backgroundColor = RandomColor.darkAndLightTheme.primaryWhite
    contentView.backgroundColor = RandomColor.darkAndLightTheme.primaryWhite
    impactFeedback.impactOccurred()
  }
  
  public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesCancelled(touches, with: event)
    backgroundColor = RandomColor.darkAndLightTheme.primaryWhite
    contentView.backgroundColor = RandomColor.darkAndLightTheme.primaryWhite
  }
  
  /// Настраиваем ячейку
  /// - Parameters:
  ///  - titleText: Заголовок
  public func configureCellWith(titleText: String?) {
    titleLable.text = titleText
    chevronImageView.image = Appearance().chevronRight
    chevronImageView.setImageColor(color: RandomColor.darkAndLightTheme.primaryGray)
  }
  
  // MARK: - Private func
  
  private func configureLayout() {
    let appearance = Appearance()
    
    [titleLable, chevronImageView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      chevronImageView.widthAnchor.constraint(equalToConstant: appearance.imageSize),
      chevronImageView.heightAnchor.constraint(equalToConstant: appearance.imageSize),
      
      titleLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                          constant: appearance.insets.left),
      titleLable.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      
      chevronImageView.leadingAnchor.constraint(equalTo: titleLable.trailingAnchor),
      chevronImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                 constant: -appearance.insets.right),
      chevronImageView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                            constant: appearance.insets.top),
      chevronImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                               constant: -appearance.insets.bottom),
    ])
  }
  
  private func applyDefaultBehavior() {
    backgroundColor = RandomColor.darkAndLightTheme.primaryWhite
    contentView.backgroundColor = RandomColor.darkAndLightTheme.primaryWhite
    selectionStyle = .none
    
    chevronImageView.contentMode = .right
    
    titleLable.font = RandomFont.primaryRegular18
    titleLable.textColor = RandomColor.darkAndLightTheme.primaryGray
  }
}

// MARK: - Appearance

private extension LabelAndChevronCell {
  struct Appearance {
    let insets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    let imageSize: CGFloat = 24
    let chevronRight = UIImage(named: "chevron_right", in: .module, compatibleWith: nil)
  }
}
