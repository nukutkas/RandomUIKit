//
//  CellsScreenDataSource+LabelAndImageCell.swift
//  RandomUIKitExample
//
//  Created by Tatiana Sosina on 22.05.2022.
//

import UIKit
import RandomUIKit

// MARK: - LabelAndImageCellModel

/// Моделька для ячейки
struct LabelAndImageCellModel: CellModel {
    
    let titleText: String?
    let image: UIImage?
    
    var titleCell: String
    var reuseIdentifier = CellsScreenCell.labelAndImageCell.reuseIdentifier
}

extension CellsScreenDataSource where Model == LabelAndImageCellModel {
    static func makeForLabelAndImage() -> CellsScreenDataSource {
        let models = [
            LabelAndImageCellModel(titleText: "LabelAndImageCell",
                                   image: UIImage(systemName: "chevron.compact.right"),
                                   titleCell: "")
        ]
        return CellsScreenDataSource(models: models) { (model, cell) in
            guard let cell = cell as? LabelAndImageCell else {
                return
            }
            cell.configureCellWith(titleText: model.titleText,
                                   imageAside: model.image)
        }
    }
}
