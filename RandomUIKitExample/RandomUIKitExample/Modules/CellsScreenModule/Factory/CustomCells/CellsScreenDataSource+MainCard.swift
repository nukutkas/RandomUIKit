//
//  CellsScreenDataSource+MainCard.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import Foundation

// MARK: - MainCardModel

/// Моделька для ячейки
struct MainCardModel: CellModel {
    var titleView: String
    var reuseIdentifier = CellsScreenCell.mainCardTableViewCell.reuseIdentifier
}

extension CellsScreenDataSource where Model == MainCardModel {
    static func makeForMainCard() -> CellsScreenDataSource {
        let models = [
            MainCardModel(titleView: "MainCardView")
        ]
        return CellsScreenDataSource(models: models) { (model, cell) in
            guard let cell = cell as? MainCardTableViewCell else {
                return
            }
            cell.configureCellWith(text: model.titleView)
        }
    }
}
