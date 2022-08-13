//
//  CellsScreenDataSource+LabelAndSwitchWithSegmented.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 10.07.2022.
//

import UIKit
import RandomUIKit

// MARK: - LabelAndSwitchWithSegmentedModel

/// Моделька для ячейки
struct LabelAndSwitchWithSegmentedModel: CellModel {
    var titleCell: String
    var reuseIdentifier = CellsScreenCell.labelAndSwitchWithSegmentedCell.reuseIdentifier
}

extension CellsScreenDataSource where Model == LabelAndSwitchWithSegmentedModel {
    static func makeForLabelAndSwitchWithSegmented() -> CellsScreenDataSource {
        let models = [
          LabelAndSwitchWithSegmentedModel(titleCell: "LabelAndSwitchWithSegmentedCell")
        ]
        return CellsScreenDataSource(models: models) { (model, cell) in
            guard let cell = cell as? LabelAndSwitchWithSegmentedCell else {
                return
            }
          cell.removeAllSegments()
          cell.insertSegment(withTitle: "hit", at: 0, animated: false)
          cell.insertSegment(withTitle: "new", at: 1, animated: false)
          cell.insertSegment(withTitle: "premium", at: 2, animated: false)
          cell.insertSegment(withTitle: "none", at: 3, animated: false)
          cell.selectedSegmentIndex = .zero
          cell.configureCellWith(titleText: "LabelAndSwitchWithSegmentedCell", isResultSwitch: true)
        }
    }
}
