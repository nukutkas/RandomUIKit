//
//  CellsScreenDataSource+CustomPaddingCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 24.05.2022.
//

import UIKit

// MARK: - CustomPaddingCellModel

/// Моделька для ячейки
struct CustomPaddingCellModel: CellModel {
    
    let height: CGFloat
    
    var titleCell: String
    var reuseIdentifier = CellsScreenCell.customPaddingCell.reuseIdentifier
}

extension CellsScreenDataSource where Model == CustomPaddingCellModel {
    static func makeForCustomPadding() -> CellsScreenDataSource {
        let models = [
            CustomPaddingCellModel(height: 80,
                                   titleCell: "CustomPaddingCell")
        ]
        return CellsScreenDataSource(models: models) { (model, cell) in
            guard let cell = cell as? CustomPaddingCell else {
                return
            }
            cell.configureCellWith(height: model.height, titleText: model.titleCell)
        }
    }
}
