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
  let buttonImageSystemName: String?
  let buttonImageColor: UIColor?
  
  var titleCell: String
  var reuseIdentifier = CellsScreenCell.textFieldWithButton.reuseIdentifier
}

extension CellsScreenDataSource where Model == TextFieldWithButtonModel {
  static func makeForTextFieldWithButton() -> CellsScreenDataSource {
    let models = [
      TextFieldWithButtonModel(
        buttonImageSystemName: "checkmark.circle.fill",
        buttonImageColor: RandomColor.primaryGreen,
        titleCell: ""
      ),
      TextFieldWithButtonModel(
        buttonImageSystemName: "checkmark.diamond.fill",
        buttonImageColor: RandomColor.primaryRed,
        titleCell: ""
      ),
      TextFieldWithButtonModel(
        buttonImageSystemName: "checkmark.seal",
        buttonImageColor: RandomColor.primaryBlue,
        titleCell: ""
      )
    ]
    return CellsScreenDataSource(models: models) { (model, cell) in
      guard let cell = cell as? TextFieldWithButtonCell else {
        return
      }
      
      let textField = TextFieldView()
      textField.placeholder = "TextFieldWithButtonCell"
      
      cell.configureCellWith(
        textField: textField,
        buttonImageSystemName: model.buttonImageSystemName,
        buttonImageColor: model.buttonImageColor,
        buttonAction: {
          print("buttonAction")
        }
      )
    }
  }
}

