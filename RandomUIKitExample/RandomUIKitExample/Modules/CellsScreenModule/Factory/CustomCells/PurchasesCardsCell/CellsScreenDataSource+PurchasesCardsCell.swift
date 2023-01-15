//
//  CellsScreenDataSource+PurchasesCardsCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 14.01.2023.
//

import UIKit
import RandomUIKit

// MARK: - TextFieldWithButtonModel

/// Моделька для ячейки
struct PurchasesCardsCellModel: CellModel, PurchasesCardsCellModelProtocol {
  var header: String?
  var title: String?
  var description: String?
  var amount: String?
  var action: (() -> Void)?
  
  var titleCell: String = ""
  var reuseIdentifier = CellsScreenCell.purchasesCardsCell.reuseIdentifier
}

extension CellsScreenDataSource where Model == PurchasesCardsCellModel {
  static func makeForPurchasesCardsCell() -> CellsScreenDataSource {
    let models = [
      PurchasesCardsCellModel(header: "Покупка",
                              title: "1",
                              description: "Monthly",
                              amount: "$ 0.50",
                              action: {
                                print("Left side")
                              }),
      PurchasesCardsCellModel(header: "MOST POPULAR",
                              title: "12",
                              description: "Yearly",
                              amount: "$ 2.55",
                              action: {
                                print("Center side")
                              }),
      PurchasesCardsCellModel(header: "Подписка",
                              title: "~",
                              description: "Liftime",
                              amount: "$ 50.0",
                              action: {
                                print("Right side")
                              })
    ]
    
    return CellsScreenDataSource(models: [PurchasesCardsCellModel()]) { (_, cell) in
      guard let cell = cell as? PurchasesCardsCell else {
        return
      }
      
      cell.configureCellWith(models: models)
    }
  }
}
