//
//  CellsScreenDataSource+DoubleTitleCell.swift
//  RandomUIKitExample
//
//  Created by Tatiana Sosina on 22.05.2022.
//

import UIKit
import RandomUIKit

// MARK: - DoubleTitleCellModel

/// Моделька для ячейки
struct DoubleTitleCellModel: CellModel {
    
    let primaryText: String?
    let secondaryText: String?
    
    var titleCell: String
    var reuseIdentifier = CellsScreenCell.doubleTitleCell.reuseIdentifier
}

extension CellsScreenDataSource where Model == DoubleTitleCellModel {
    static func makeForDoubleTitle() -> CellsScreenDataSource {
        let models = [
            DoubleTitleCellModel(primaryText: "DoubleTitleCell",
                                 secondaryText: "10",
                                 titleCell: "")
        ]
        return CellsScreenDataSource(models: models) { (model, cell) in
            guard let cell = cell as? DoubleTitleCell else {
                return
            }
            cell.configureCellWith(primaryText: model.primaryText,
                                   secondaryText: model.secondaryText)
        }
    }
}
