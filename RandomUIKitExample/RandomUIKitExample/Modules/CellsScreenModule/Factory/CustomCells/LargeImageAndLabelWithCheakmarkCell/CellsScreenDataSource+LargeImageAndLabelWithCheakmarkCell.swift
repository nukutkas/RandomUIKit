//
//  CellsScreenDataSource+LargeImageAndLabelWithCheakmarkCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 25.01.2023.
//

import UIKit
import RandomUIKit

// MARK: - LargeImageAndLabelWithCheakmarkCell

/// Моделька для ячейки
struct LargeImageAndLabelWithCheakmarkCellModel: CellModel {
  
  let leftSideImage: UIImage?
  let titleText: String?
  let setIsCheckmark: Bool
  var action: ((Bool) -> Void)?
  
  var titleCell: String = ""
  var reuseIdentifier = CellsScreenCell.largeImageAndLabelWithCheakmarkCell.reuseIdentifier
}

extension CellsScreenDataSource where Model == LargeImageAndLabelWithCheakmarkCellModel {
  static func makeForLargeImageAndLabelWithCheakmarkCell() -> CellsScreenDataSource {
    let models = [
      LargeImageAndLabelWithCheakmarkCellModel(leftSideImage: UIImage(named: "Random_Pro_Image"),
                                               titleText: "Стандартная",
                                               setIsCheckmark: true,
                                               action: { isCheckmark in
                                                 print("Ячейка выбрана \(isCheckmark)")
                                               }),
      LargeImageAndLabelWithCheakmarkCellModel(leftSideImage: UIImage(named: "Random_Pro_Image"),
                                               titleText: "Сочи",
                                               setIsCheckmark: false,
                                               action: { isCheckmark in
                                                 print("Ячейка выбрана \(isCheckmark)")
                                               }),
      LargeImageAndLabelWithCheakmarkCellModel(leftSideImage: UIImage(named: "Random_Pro_Image"),
                                               titleText: "Бостон",
                                               setIsCheckmark: false,
                                               action: { isCheckmark in
                                                 print("Ячейка выбрана \(isCheckmark)")
                                               }),
      LargeImageAndLabelWithCheakmarkCellModel(leftSideImage: UIImage(named: "Random_Pro_Image"),
                                               titleText: "LargeImageAndLabelWithCheakmarkCell",
                                               setIsCheckmark: false,
                                               action: { isCheckmark in
                                                 print("Ячейка выбрана \(isCheckmark)")
                                               }),
    ]
    
    return CellsScreenDataSource(models: models) { (model, cell) in
      guard let cell = cell as? LargeImageAndLabelWithCheakmarkCell else {
        return
      }
      cell.configureCellWith(leftSideImage: model.leftSideImage,
                             titleText: model.titleText,
                             setIsCheckmark: model.setIsCheckmark,
                             setIsLocked: true,
                             action: model.action)
    }
  }
}
