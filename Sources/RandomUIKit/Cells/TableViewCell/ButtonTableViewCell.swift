//
//  ButtonTableViewCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit

// MARK: - ButtonTableViewCell

public final class ButtonTableViewCell: UITableViewCell {
  
  // MARK: - Private properties
  
  private let buttonView = ButtonView()
  
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
  /// - Parameter completion: Возвращает кнопку
  public func configureCellWith(completion: ((ButtonView) -> Void)?) {
    completion?(buttonView)
  }
  
  // MARK: - Private func
  
  private func configureLayout() {
    let appearance = Appearance()
    
    [buttonView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      buttonView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                      constant: appearance.minInset),
      buttonView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                          constant: appearance.defaultInset),
      buttonView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                           constant: -appearance.defaultInset),
      buttonView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                         constant: -appearance.minInset)
    ])
  }
  
  private func applyDefaultBehavior() {
    backgroundColor = RandomColor.primaryWhite
    selectionStyle = .none
  }
}

// MARK: - Appearance

private extension ButtonTableViewCell {
  struct Appearance {
    let minInset: CGFloat = 4
    let defaultInset: CGFloat = 16
  }
}
