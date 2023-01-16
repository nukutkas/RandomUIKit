//
//  CellsScreenDataSource+HeaderTitleAndSubtitleViewCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 16.01.2023.
//

import UIKit
import RandomUIKit

// MARK: - HeaderTitleAndSubtitleViewCellModel

/// Моделька для ячейки
struct HeaderTitleAndSubtitleViewCellModel: CellModel {

  var titleCell: String = ""
  var reuseIdentifier = CellsScreenCell.headerTitleAndSubtitleViewCell.reuseIdentifier
}

extension CellsScreenDataSource where Model == HeaderTitleAndSubtitleViewCellModel {
  static func makeForHeaderTitleAndSubtitleViewCell() -> CellsScreenDataSource {
    let models = [
      HeaderTitleAndSubtitleViewCellModel()
    ]
    
    return CellsScreenDataSource(models: models) { (model, cell) in
      guard let cell = cell as? HeaderTitleAndSubtitleViewCell else {
        return
      }
      cell.configureCellWith(title: "Get Premium",
                             subtitle: "Get All The New Exciting Features")
    }
  }
}
