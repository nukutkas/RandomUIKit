//
//  CellsScreenDataSource+Button.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit
import RandomUIKit

// MARK: - ButtonModel

/// Моделька для ячейки
struct ButtonModel: CellModel {
  var titleCell: String
  var reuseIdentifier = CellsScreenCell.button.reuseIdentifier
}

extension CellsScreenDataSource where Model == ButtonModel {
  static func makeForButton() -> CellsScreenDataSource {
    
    return CellsScreenDataSource(models: [ButtonModel(titleCell: "")]) { (model, cell) in
      guard let cell = cell as? ButtonTableViewCell else {
        return
      }
      cell.configureCellWith { button in
        button.setTitle("Кнопка", for: .normal)
      }
    }
  }
}
