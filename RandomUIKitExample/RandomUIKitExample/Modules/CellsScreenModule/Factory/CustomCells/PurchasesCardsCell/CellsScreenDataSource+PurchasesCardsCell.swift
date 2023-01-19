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
struct PurchasesCardsCellModelExample: CellModel {
  var titleCell: String = ""
  var reuseIdentifier = CellsScreenCell.purchasesCardsCell.reuseIdentifier
}

extension CellsScreenDataSource where Model == PurchasesCardsCellModelExample {
  static func makeForPurchasesCardsCell() -> CellsScreenDataSource {
    let models = [
      PurchasesCardsCellModel(header: "7 дней бесплатно",
                              title: "12",
                              description: "Ежегодно",
                              amount: "$ 0.50",
                              action: {
                                print("Left side")
                              }),
      PurchasesCardsCellModel(header: "Самый популярный",
                              title: "1",
                              description: "Ежемесячно",
                              amount: "$ 2.55",
                              action: {
                                print("Center side")
                              }),
      PurchasesCardsCellModel(header: "Разовая покупка",
                              title: "∞",
                              description: "Навсегда",
                              amount: "$ 1 000",
                              action: {
                                print("Right side")
                              })
    ]
    
    return CellsScreenDataSource(models: [PurchasesCardsCellModelExample()]) { (_, cell) in
      guard let cell = cell as? PurchasesCardsCell else {
        return
      }
      
      cell.configureCellWith(models: models)
    }
  }
}
