//
//  CellsScreenDataSource+ImageAndLabelWithSwitchCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 24.01.2023.
//

import UIKit
import RandomUIKit

// MARK: - ImageAndLabelWithSwitchCell

/// Моделька для ячейки
struct ImageAndLabelWithSwitchCellModel: CellModel {
  let leftSideImage: UIImage?
  let leftSideImageColor: UIColor?
  let isSwitch: Bool
  
  var titleCell: String = "ImageAndLabelWithSwitchCell"
  var reuseIdentifier = CellsScreenCell.imageAndLabelWithSwitchCell.reuseIdentifier
}

extension CellsScreenDataSource where Model == ImageAndLabelWithSwitchCellModel {
  static func makeForImageAndLabelWithSwitchCell() -> CellsScreenDataSource {
    let models = [
      ImageAndLabelWithSwitchCellModel(leftSideImage: UIImage(systemName: "phone"),
                                       leftSideImageColor: nil,
                                       isSwitch: true)
    ]
    
    return CellsScreenDataSource(models: models) { (model, cell) in
      guard let cell = cell as? ImageAndLabelWithSwitchCell else {
        return
      }
      cell.configureCellWith(leftSideImage: model.leftSideImage,
                             leftSideImageColor: model.leftSideImageColor,
                             titleText: model.titleCell,
                             isResultSwitch: model.isSwitch)
    }
  }
}
