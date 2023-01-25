//
//  CellsScreenDataSource+ImageAndDoubleTitleCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 24.01.2023.
//

import UIKit
import RandomUIKit

// MARK: - ImageAndDoubleTitleCellModel

/// Моделька для ячейки
struct ImageAndDoubleTitleCellModel: CellModel {
  let leftSideImage: UIImage?
  let leftSideImageColor: UIColor?
  let primaryText: String?
  let secondaryText: String?
  let secondaryTextColor: UIColor
  let secondaryTextFont: UIFont
  
  var titleCell: String = ""
  var reuseIdentifier = CellsScreenCell.imageAndDoubleTitleCell.reuseIdentifier
}

extension CellsScreenDataSource where Model == ImageAndDoubleTitleCellModel {
  static func makeForImageAndDoubleTitleCell() -> CellsScreenDataSource {
    let models = [
      ImageAndDoubleTitleCellModel(leftSideImage: UIImage(systemName: "phone"),
                                   leftSideImageColor: nil,
                                   primaryText: "ImageAndDoubleTitleCellModel",
                                   secondaryText: "10",
                                   secondaryTextColor: RandomColor.only.primaryRed,
                                   secondaryTextFont: RandomFont.primaryBold18)
    ]
    
    return CellsScreenDataSource(models: models) { (model, cell) in
      guard let cell = cell as? ImageAndDoubleTitleCell else {
        return
      }
      cell.configureCellWith(leftSideImage: model.leftSideImage,
                             leftSideImageColor: model.leftSideImageColor,
                             primaryText: model.primaryText,
                             secondaryText: model.secondaryText)
    }
  }
}
