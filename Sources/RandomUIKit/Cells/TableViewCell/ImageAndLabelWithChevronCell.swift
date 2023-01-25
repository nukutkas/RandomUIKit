//
//  ImageAndLabelWithChevronCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 24.01.2023.
//

import UIKit

// MARK: - ImageAndLabelWithChevronCell

public final class ImageAndLabelWithChevronCell: UITableViewCell {
  
  // MARK: - Public property
  
  /// Identifier для ячейки
  public static let reuseIdentifier = ImageAndLabelWithChevronCell.description()
  
  // MARK: - Private property
  
  private let titleLable = UILabel()
  private let chevronImageView = UIImageView()
  private let leftSideImageView = UIImageView()
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
  ///  - leftSideImage: Картинка слева
  ///  - leftSideImageColor: Цвет картинки слева
  ///  - titleText: Заголовок
  ///  - isChevron: Шеврон включен
  public func configureCellWith(leftSideImage: UIImage?,
                                leftSideImageColor: UIColor?,
                                titleText: String?,
                                isChevron: Bool) {
    titleLable.text = titleText
    chevronImageView.isHidden = !isChevron
    chevronImageView.image = Appearance().chevronRight
    chevronImageView.setImageColor(color: RandomColor.darkAndLightTheme.primaryGray)
    leftSideImageView.image = leftSideImage
    leftSideImageView.setImageColor(color: leftSideImageColor ?? RandomColor.darkAndLightTheme.primaryGray)
  }
  
  // MARK: - Private func
  
  private func configureLayout() {
    let appearance = Appearance()
    
    [titleLable, chevronImageView, leftSideImageView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      chevronImageView.widthAnchor.constraint(equalToConstant: appearance.imageSize),
      chevronImageView.heightAnchor.constraint(equalToConstant: appearance.imageSize),
      leftSideImageView.widthAnchor.constraint(equalToConstant: appearance.imageSize),
      leftSideImageView.heightAnchor.constraint(equalToConstant: appearance.imageSize),
      
      leftSideImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                 constant: appearance.insets.left),
      leftSideImageView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                             constant: appearance.insets.top),
      leftSideImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                constant: -appearance.insets.bottom),
      
      titleLable.leadingAnchor.constraint(equalTo: leftSideImageView.trailingAnchor,
                                          constant: appearance.insets.left),
      titleLable.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      
      chevronImageView.leadingAnchor.constraint(equalTo: titleLable.trailingAnchor),
      chevronImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                 constant: -appearance.insets.right),
      chevronImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
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

private extension ImageAndLabelWithChevronCell {
  struct Appearance {
    let insets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    let imageSize: CGFloat = 24
    let chevronRight = UIImage(named: "chevron_right", in: .module, compatibleWith: nil)
  }
}
