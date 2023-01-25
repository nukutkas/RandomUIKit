//
//  CellsScreenDataSource+SmallButtonCell.swift
//  RandomUIKitExample
//
//  Created by Tatiana Sosina on 22.05.2022.
//

import UIKit
import RandomUIKit

// MARK: - SmallButtonCellModel

/// Моделька для ячейки
struct SmallButtonCellModel: CellModel {
  
  let titleButton: String?
  let color: UIColor?
  
  var titleCell: String
  var reuseIdentifier = CellsScreenCell.smallButtonCell.reuseIdentifier
}

extension CellsScreenDataSource where Model == SmallButtonCellModel {
  static func makeForSmallButton() -> CellsScreenDataSource {
    let models = [
      SmallButtonCellModel(titleButton: "SmallButtonCell",
                           color: RandomColor.only.primaryBlue,
                           titleCell: ""),
      SmallButtonCellModel(titleButton: "SmallButtonCell",
                           color: RandomColor.only.primaryRed,
                           titleCell: "")
    ]
    return CellsScreenDataSource(models: models) { (model, cell) in
      guard let cell = cell as? SmallButtonCell else {
        return
      }
      cell.configureCellWith(titleButton: model.titleButton,
                             color: model.color)
    }
  }
}
