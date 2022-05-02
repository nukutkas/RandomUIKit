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
    let titleButton: String?
    let gradientBackground: [UIColor]
    
    var titleCell: String
    var reuseIdentifier = CellsScreenCell.button.reuseIdentifier
}

extension CellsScreenDataSource where Model == ButtonModel {
    static func makeForButton() -> CellsScreenDataSource {
        let models = [
            ButtonModel(titleButton: "Сгенерировать",
                        gradientBackground: [
                            RandomColor.primaryGreen,
                            RandomColor.secondaryGreen
                        ],
                        titleCell: "ButtonView")
        ]
        return CellsScreenDataSource(models: models) { (model, cell) in
            guard let cell = cell as? ButtonTableViewCell else {
                return
            }
            cell.configureCellWith(titleCell: model.titleCell,
                                   titleButton: model.titleButton,
                                   gradientBackground: model.gradientBackground)
        }
    }
}
