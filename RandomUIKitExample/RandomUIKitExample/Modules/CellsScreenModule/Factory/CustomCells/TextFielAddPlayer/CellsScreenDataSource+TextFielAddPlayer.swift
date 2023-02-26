//
//  CellsScreenDataSource+TextFielAddPlayer.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 16.09.2022.
//

import UIKit
import RandomUIKit

// MARK: - TextFielAddPlayerModel

/// Моделька для ячейки
struct TextFielAddPlayerModel: CellModel {
  let buttonImage: UIImage?
  let buttonImageColor: UIColor?
  
  var titleCell: String
  var reuseIdentifier = CellsScreenCell.textFielAddPlayerCell.reuseIdentifier
}

extension CellsScreenDataSource where Model == TextFielAddPlayerModel {
  static func makeForTextFielAddPlayer() -> CellsScreenDataSource {
    
    let largeConfig = UIImage.SymbolConfiguration(pointSize: 20,
                                                  weight: .bold,
                                                  scale: .large)
    
    let circle = UIImage(systemName: "checkmark.circle.fill", withConfiguration: largeConfig)
    
    let models = [
      TextFielAddPlayerModel(
        buttonImage: circle,
        buttonImageColor: RandomColor.only.primaryGreen,
        titleCell: ""
      )
    ]
    return CellsScreenDataSource(models: models) { (model, cell) in
      guard let cell = cell as? TextFielAddPlayerCell else {
        return
      }
      
      let textField = TextFieldMultilineView()
//      textField.placeholder = "TextFielAddPlayerCell"
      
      cell.configureCellWith(
        textField: textField,
        buttonImage: model.buttonImage,
        buttonImageColor: model.buttonImageColor,
        listGender: ["М", "Ж"],
        buttonAction: {
          print("buttonAction")
        },
        genderValueChanged: { index in
          print("genderValueChanged, index \(index)")
        }
      )
    }
  }
}
