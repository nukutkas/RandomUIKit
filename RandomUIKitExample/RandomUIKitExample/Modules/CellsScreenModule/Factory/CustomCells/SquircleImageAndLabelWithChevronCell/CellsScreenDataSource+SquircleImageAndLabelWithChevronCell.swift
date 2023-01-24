//
//  CellsScreenDataSource+SquircleImageAndLabelWithChevronCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 25.01.2023.
//

import UIKit
import RandomUIKit

// MARK: - SquircleImageAndLabelWithChevronCell

/// Моделька для ячейки
struct SquircleImageAndLabelWithChevronCellModel: CellModel {
  let squircleBGColors: [UIColor]
  let squircleBGAlpha: CGFloat
  let leftSideImage: UIImage?
  let leftSideImageColor: UIColor?
  let titleText: String?
  let isChevron: Bool
  
  var titleCell: String = ""
  var reuseIdentifier = CellsScreenCell.squircleImageAndLabelWithChevronCell.reuseIdentifier
}

extension CellsScreenDataSource where Model == SquircleImageAndLabelWithChevronCellModel {
  static func makeForSquircleImageAndLabelWithChevronCell() -> CellsScreenDataSource {
    let models = [
      SquircleImageAndLabelWithChevronCellModel(squircleBGColors: [RandomColor.primaryGreen,
                                                                   RandomColor.primaryGray],
                                                squircleBGAlpha: 1,
                                                leftSideImage: UIImage(systemName: "cursorarrow.click.2"),
                                                leftSideImageColor: .white,
                                                titleText: "SquircleImageAndLabelWithChevronCell",
                                                isChevron: true),
      SquircleImageAndLabelWithChevronCellModel(squircleBGColors: [RandomColor.primaryGreen,
                                                                   RandomColor.primaryGray],
                                                squircleBGAlpha: 1,
                                                leftSideImage: UIImage(systemName: "cursorarrow.click.2"),
                                                leftSideImageColor: .white,
                                                titleText: "SquircleImageAndLabelWithChevronCell",
                                                isChevron: false),
    ]
    
    return CellsScreenDataSource(models: models) { (model, cell) in
      guard let cell = cell as? SquircleImageAndLabelWithChevronCell else {
        return
      }
      cell.configureCellWith(squircleBGColors: model.squircleBGColors,
                             leftSideImage: model.leftSideImage,
                             leftSideImageColor: model.leftSideImageColor,
                             titleText: model.titleText,
                             isChevron: model.isChevron)
    }
  }
}
