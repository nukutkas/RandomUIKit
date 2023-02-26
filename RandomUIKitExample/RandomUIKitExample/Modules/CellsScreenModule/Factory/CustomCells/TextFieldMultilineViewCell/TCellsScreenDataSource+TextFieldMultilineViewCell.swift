//
//  TCellsScreenDataSource+TextFieldMultilineViewCell.swift
//  RandomUIKitExample
//
//  Created by Никита Кочетов on 25.02.2023.
//

import UIKit
import RandomUIKit

// MARK: - FilmViewCell

/// Моделька для ячейки
struct TextFieldMultilineViewCellModel: CellModel {
  let titlePlaceholder: String?
  var titleCell: String = "TextFieldMultilineViewCell"
  var reuseIdentifier = CellsScreenCell.textFieldMultilineViewCell.reuseIdentifier
}

extension CellsScreenDataSource where Model == TextFieldMultilineViewCellModel {
    static func makeForTextFieldMultilineViewCell() -> CellsScreenDataSource {
        let models = [
          TextFieldMultilineViewCellModel(titlePlaceholder: "Hello, World\nHello, World\nHello, World",
                                          titleCell: "TextFieldMultilineView")
        ]
        return CellsScreenDataSource(models: models) { (model, cell) in
            guard let cell = cell as? TextFieldMultilineViewCell else {
                return
            }
            cell.configureCellWith(titleCell: model.titleCell,
                                   titlePlaceholder: model.titlePlaceholder)
        }
    }
}

