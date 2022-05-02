//
//  CellsScreenDataSource+ScrollLabelGradient.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit
import RandomUIKit

// MARK: - ScrollLabelGradientModel

/// Моделька для ячейки
struct ScrollLabelGradientModel: CellModel {
    var listLabels: [String?]
    
    var titleCell: String
    var reuseIdentifier = CellsScreenCell.scrollLabelGradientView.reuseIdentifier
}

extension CellsScreenDataSource where Model == ScrollLabelGradientModel {
    static func makeForScrollLabelGradient() -> CellsScreenDataSource {
        let models = [
            ScrollLabelGradientModel(listLabels: ["1", "2", "3", "4", "5", "6", "7", "8",
                                                  "9", "10", "11", "12", "13", "14", "15"],
                                     titleCell: "ScrollLabelGradientView")
        ]
        return CellsScreenDataSource(models: models) { (model, cell) in
            guard let cell = cell as? ScrollLabelGradientTableViewCell else {
                return
            }
            cell.configureCellWith(titleCell: model.titleCell,
                                   listLabels: model.listLabels)
        }
    }
}
