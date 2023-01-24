//
//  CellsScreenDataSource+SquircleViewCell.swift
//  RandomUIKitExample
//
//  Created by SOSIN Vitaly on 24.01.2023.
//

import UIKit
import RandomUIKit

// MARK: - SquircleViewCellModel

/// Моделька для ячейки
struct SquircleViewCellModel: CellModel {

  var titleCell: String = "SquircleView"
  var reuseIdentifier = CellsScreenCell.squircleViewCell.reuseIdentifier
}

extension CellsScreenDataSource where Model == SquircleViewCellModel {
  static func makeForSquircleViewCell() -> CellsScreenDataSource {
    let models = [
      SquircleViewCellModel()
    ]

    return CellsScreenDataSource(models: models) { (model, cell) in
      guard let cell = cell as? SquircleViewCell else {
        return
      }
      cell.configureCellWith(titleCell: model.titleCell)
    }
  }
}
