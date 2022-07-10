//
//  CellsScreenDataSource+ScrollLabelSegmented.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 10.07.2022.
//

import UIKit
import RandomUIKit

// MARK: - ScrollLabelSegmentedModel

/// Моделька для ячейки
struct ScrollLabelSegmentedModel: CellModel {
    var titleCell: String
    var reuseIdentifier = CellsScreenCell.scrollLabelSegmentedControlCell.reuseIdentifier
}

extension CellsScreenDataSource where Model == ScrollLabelSegmentedModel {
    static func makeForScrollLabelSegmented() -> CellsScreenDataSource {
        let models = [
          ScrollLabelSegmentedModel(titleCell: "ScrollLabelSegmentedControlCell")
        ]
        return CellsScreenDataSource(models: models) { (model, cell) in
            guard let cell = cell as? ScrollLabelSegmentedControlCell else {
                return
            }
          cell.removeAllSegments()
          cell.insertSegment(withTitle: model.titleCell, at: 0, animated: false)
          cell.insertSegment(withTitle: model.titleCell, at: 1, animated: false)
          cell.insertSegment(withTitle: model.titleCell, at: 2, animated: false)
          cell.insertSegment(withTitle: model.titleCell, at: 3, animated: false)
          cell.selectedSegmentIndex = .zero
        }
    }
}
