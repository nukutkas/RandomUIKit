//
//  CellsScreenDataSource+ImageAndLabelWithChevronCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 24.01.2023.
//

import UIKit
import RandomUIKit

// MARK: - ImageAndLabelWithChevronCellModel

/// Моделька для ячейки
struct ImageAndLabelWithChevronCellModel: CellModel {
  let leftSideImage: UIImage?
  let leftSideImageColor: UIColor?
  let titleText: String?
  let isChevron: Bool
  
  var titleCell: String = ""
  var reuseIdentifier = CellsScreenCell.imageAndLabelWithChevronCell.reuseIdentifier
}

extension CellsScreenDataSource where Model == ImageAndLabelWithChevronCellModel {
  static func makeForImageAndLabelWithChevronCell() -> CellsScreenDataSource {
    let models = [
      ImageAndLabelWithChevronCellModel(leftSideImage: UIImage(systemName: "phone"),
                                        leftSideImageColor: RandomColor.only.primaryBlue,
                                        titleText: "ImageAndLabelWithChevronCell",
                                        isChevron: true),
      ImageAndLabelWithChevronCellModel(leftSideImage: UIImage(systemName: "cursorarrow.click.2"),
                                        leftSideImageColor: nil,
                                        titleText: "ImageAndLabelWithChevronCell",
                                        isChevron: false),
    ]
    
    return CellsScreenDataSource(models: models) { (model, cell) in
      guard let cell = cell as? ImageAndLabelWithChevronCell else {
        return
      }
      cell.configureCellWith(leftSideImage: model.leftSideImage,
                             leftSideImageColor: model.leftSideImageColor,
                             titleText: model.titleText,
                             isChevron: model.isChevron)
    }
  }
}
