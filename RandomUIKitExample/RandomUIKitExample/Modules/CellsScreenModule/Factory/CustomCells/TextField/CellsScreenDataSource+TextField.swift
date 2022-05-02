//
//  CellsScreenDataSource+TextField.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit
import RandomUIKit

// MARK: - TextFieldModel

/// Моделька для ячейки
struct TextFieldModel: CellModel {
    let titlePlaceholder: String?
    
    var titleCell: String
    var reuseIdentifier = CellsScreenCell.textField.reuseIdentifier
}

extension CellsScreenDataSource where Model == TextFieldModel {
    static func makeForTextField() -> CellsScreenDataSource {
        let models = [
            TextFieldModel(titlePlaceholder: "Hello, World",
                           titleCell: "TextFieldView")
        ]
        return CellsScreenDataSource(models: models) { (model, cell) in
            guard let cell = cell as? TextFieldTableViewCell else {
                return
            }
            cell.configureCellWith(titleCell: model.titleCell,
                                   titlePlaceholder: model.titlePlaceholder)
        }
    }
}
