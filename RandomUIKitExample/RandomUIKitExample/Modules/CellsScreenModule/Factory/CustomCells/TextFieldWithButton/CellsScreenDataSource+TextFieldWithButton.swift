//
//  CellsScreenDataSource+TextFieldWithButton.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 13.08.2022.
//

import UIKit
import RandomUIKit

// MARK: - TextFieldWithButtonModel

/// Моделька для ячейки
struct TextFieldWithButtonModel: CellModel {
  let buttonImage: UIImage?
  let buttonImageColor: UIColor?
  
  var titleCell: String
  var reuseIdentifier = CellsScreenCell.textFieldWithButton.reuseIdentifier
}

extension CellsScreenDataSource where Model == TextFieldWithButtonModel {
  static func makeForTextFieldWithButton() -> CellsScreenDataSource {
    
    let largeConfig = UIImage.SymbolConfiguration(pointSize: 20,
                                                  weight: .bold,
                                                  scale: .large)
    
    let circle = UIImage(systemName: "checkmark.circle.fill", withConfiguration: largeConfig)
    let checkmark = UIImage(systemName: "checkmark.diamond.fill", withConfiguration: largeConfig)
    let seal = UIImage(systemName: "checkmark.seal", withConfiguration: largeConfig)
    
    let models = [
      TextFieldWithButtonModel(
        buttonImage: circle,
        buttonImageColor: RandomColor.only.primaryGreen,
        titleCell: ""
      ),
      TextFieldWithButtonModel(
        buttonImage: checkmark,
        buttonImageColor: RandomColor.only.primaryRed,
        titleCell: ""
      ),
      TextFieldWithButtonModel(
        buttonImage: seal,
        buttonImageColor: RandomColor.only.primaryBlue,
        titleCell: ""
      )
    ]
    return CellsScreenDataSource(models: models) { (model, cell) in
      guard let cell = cell as? TextFieldWithButtonCell else {
        return
      }
      
      let textField = TextFieldMultilineView()
//      textField.placeholder = "TextFieldWithButtonCell"
      
      cell.configureCellWith(
        textField: textField,
        buttonImage: model.buttonImage,
        buttonImageColor: model.buttonImageColor,
        buttonAction: {
          print("buttonAction")
        }
      )
    }
  }
}
