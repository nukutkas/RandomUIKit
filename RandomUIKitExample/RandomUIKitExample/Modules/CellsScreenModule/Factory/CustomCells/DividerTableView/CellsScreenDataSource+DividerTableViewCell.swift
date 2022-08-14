//
//  CellsScreenDataSource+DividerTableViewCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 14.08.2022.
//

import UIKit
import RandomUIKit

// MARK: - DividerTableViewModel

/// Моделька для ячейки
struct DividerTableViewModel: CellModel {
  let isHidden: Bool
  
  var titleCell: String
  var reuseIdentifier = CellsScreenCell.divider.reuseIdentifier
}

extension CellsScreenDataSource where Model == DividerTableViewModel {
  static func makeForDivider() -> CellsScreenDataSource {
    let models = [
      DividerTableViewModel(
        isHidden: false,
        titleCell: "DividerTableViewCell"
      ),
      DividerTableViewModel(
        isHidden: true,
        titleCell: "DividerTableViewCell"
      ),
    ]
    return CellsScreenDataSource(models: models) { (model, cell) in
      guard let cell = cell as? DividerTableViewCell else {
        return
      }
      
      let textField = TextFieldView()
      textField.placeholder = "TextFieldWithButtonCell"
      
      cell.configureCellWith(isHidden: model.isHidden)
    }
  }
}
