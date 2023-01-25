//
//  CellsScreenDataSource+SquircleImageAndLabelWithSwitchCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 25.01.2023.
//

import UIKit
import RandomUIKit

// MARK: - SquircleImageAndLabelWithSwitchCell

/// Моделька для ячейки
struct SquircleImageAndLabelWithSwitchCellModel: CellModel {
  let squircleBGColors: [UIColor]
  let squircleBGAlpha: CGFloat
  let leftSideImage: UIImage?
  let leftSideImageColor: UIColor?
  let isSwitch: Bool
  
  var titleCell: String = "SquircleImageAndLabelWithSwitchCell"
  var reuseIdentifier = CellsScreenCell.squircleImageAndLabelWithSwitchCell.reuseIdentifier
}

extension CellsScreenDataSource where Model == SquircleImageAndLabelWithSwitchCellModel {
  static func makeForSquircleImageAndLabelWithSwitchCell() -> CellsScreenDataSource {
    let models = [
      SquircleImageAndLabelWithSwitchCellModel(squircleBGColors: [RandomColor.only.primaryGreen,
                                                                  RandomColor.darkAndLightTheme.primaryGray],
                                               squircleBGAlpha: 1,
                                               leftSideImage: UIImage(systemName: "cursorarrow.click.2"),
                                               leftSideImageColor: .white,
                                               isSwitch: true)
    ]
    
    return CellsScreenDataSource(models: models) { (model, cell) in
      guard let cell = cell as? SquircleImageAndLabelWithSwitchCell else {
        return
      }
      cell.configureCellWith(squircleBGColors: model.squircleBGColors,
                             squircleBGAlpha: model.squircleBGAlpha,
                             leftSideImage: model.leftSideImage,
                             leftSideImageColor: model.leftSideImageColor,
                             titleText: model.titleCell,
                             isResultSwitch: model.isSwitch)
    }
  }
}
