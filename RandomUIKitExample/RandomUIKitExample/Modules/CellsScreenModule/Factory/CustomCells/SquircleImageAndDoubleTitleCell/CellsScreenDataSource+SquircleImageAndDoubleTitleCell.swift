//
//  CellsScreenDataSource+SquircleImageAndDoubleTitleCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 25.01.2023.
//

import UIKit
import RandomUIKit

// MARK: - SquircleImageAndDoubleTitleCell

/// Моделька для ячейки
struct SquircleImageAndDoubleTitleCellModel: CellModel {
  let squircleBGColors: [UIColor]
  let squircleBGAlpha: CGFloat
  let leftSideImage: UIImage?
  let leftSideImageColor: UIColor?
  let primaryText: String?
  let secondaryText: String?
  let secondaryTextColor: UIColor
  let secondaryTextFont: UIFont
  
  var titleCell: String = ""
  var reuseIdentifier = CellsScreenCell.squircleImageAndDoubleTitleCell.reuseIdentifier
}

extension CellsScreenDataSource where Model == SquircleImageAndDoubleTitleCellModel {
  static func makeForSquircleImageAndDoubleTitleCell() -> CellsScreenDataSource {
    let models = [
      SquircleImageAndDoubleTitleCellModel(squircleBGColors: [RandomColor.only.primaryGreen,
                                                              RandomColor.darkAndLightTheme.primaryGray],
                                           squircleBGAlpha: 1,
                                           leftSideImage: UIImage(systemName: "cursorarrow.click.2"),
                                           leftSideImageColor: .white,
                                           primaryText: "SquircleImageAndDoubleTitleCell",
                                           secondaryText: "10",
                                           secondaryTextColor: RandomColor.only.primaryRed,
                                           secondaryTextFont: RandomFont.primaryBold18)
    ]
    
    return CellsScreenDataSource(models: models) { (model, cell) in
      guard let cell = cell as? SquircleImageAndDoubleTitleCell else {
        return
      }
      cell.configureCellWith(squircleBGColors: model.squircleBGColors,
                             leftSideImage: model.leftSideImage,
                             leftSideImageColor: model.leftSideImageColor,
                             primaryText: model.primaryText,
                             secondaryText: model.secondaryText)
    }
  }
}
