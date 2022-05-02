//
//  CellsScreenDataSource+LabelGradient.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit
import RandomUIKit

// MARK: - LabelGradientModel

/// Моделька для ячейки
struct LabelGradientModel: CellModel {
    let titleADVText: String?
    let gradientDVLabel: [UIColor]
    
    var titleCell: String
    var reuseIdentifier = CellsScreenCell.labelGradientView.reuseIdentifier
}

extension CellsScreenDataSource where Model == LabelGradientModel {
    static func makeForLabelGradient() -> CellsScreenDataSource {
        let models = [
            LabelGradientModel(titleADVText: "23",
                               gradientDVLabel: [
                                RandomColor.primaryRed,
                                RandomColor.secondaryRed
                               ],
                               titleCell: "LabelGradientView"),
            LabelGradientModel(titleADVText: "ХИТ",
                               gradientDVLabel: [
                                RandomColor.primaryGreen,
                                RandomColor.secondaryGreen
                               ],
                               titleCell: "LabelGradientView")
        ]
        return CellsScreenDataSource(models: models) { (model, cell) in
            guard let cell = cell as? LabelGradientTableViewCell else {
                return
            }
            cell.configureCellWith(titleCell: model.titleCell,
                                   titleADVText: model.titleADVText,
                                   gradientDVLabel: model.gradientDVLabel)
        }
    }
}
