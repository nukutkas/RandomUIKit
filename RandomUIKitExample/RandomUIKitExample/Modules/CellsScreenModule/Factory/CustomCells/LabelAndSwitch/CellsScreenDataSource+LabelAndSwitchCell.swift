//
//  CellsScreenDataSource+LabelAndSwitchCell.swift
//  RandomUIKitExample
//
//  Created by Tatiana Sosina on 22.05.2022.
//

import UIKit
import RandomUIKit

// MARK: - LabelAndSwitchCellModel

/// Моделька для ячейки
struct LabelAndSwitchCellModel: CellModel {
    let isSwitch: Bool
    
    var titleCell: String
    var reuseIdentifier = CellsScreenCell.labelAndSwitchCell.reuseIdentifier
}

extension CellsScreenDataSource where Model == LabelAndSwitchCellModel {
    static func makeForLabelAndSwitch() -> CellsScreenDataSource {
        let models = [
            LabelAndSwitchCellModel(isSwitch: true,
                                    titleCell: "LabelAndSwitchCell")
        ]
        return CellsScreenDataSource(models: models) { (model, cell) in
            guard let cell = cell as? LabelAndSwitchCell else {
                return
            }
            cell.configureCellWith(titleText: model.titleCell,
                                   isResultSwitch: model.isSwitch)
        }
    }
}
