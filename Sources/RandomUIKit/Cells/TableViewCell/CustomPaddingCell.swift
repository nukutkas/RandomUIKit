//
//  CustomPaddingCell.swift
//
//  Created by Vitalii Sosin on 24.05.2022.
//

import UIKit

// MARK: - CustomPaddingCell

public final class CustomPaddingCell: UITableViewCell {
  
  // MARK: - Public property
  
  /// Identifier для ячейки
  public static let reuseIdentifier = CustomPaddingCell.description()
  
  // MARK: - Initilisation
  
  public override init(style: CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
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
  
  /// Настраиваем ячейку
  /// - Parameter height: Высота ячейки
  public func configureCellWith(height: CGFloat) {
    NSLayoutConstraint.activate([
      contentView.heightAnchor.constraint(equalToConstant: height)
    ])
    setNeedsLayout()
  }
  
  // MARK: - Private func
  
  private func applyDefaultBehavior() {
    backgroundColor = RandomColor.primaryWhite
    contentView.backgroundColor = RandomColor.primaryWhite
    selectionStyle = .none
  }
}
