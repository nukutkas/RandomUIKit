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
    let models = [
      TextFieldWithButtonModel(
        buttonImage: UIImage(systemName: "checkmark.circle.fill"),
        buttonImageColor: RandomColor.primaryGreen,
        titleCell: ""
      ),
      TextFieldWithButtonModel(
        buttonImage: UIImage(systemName: "checkmark.diamond.fill"),
        buttonImageColor: RandomColor.primaryRed,
        titleCell: ""
      ),
      TextFieldWithButtonModel(
        buttonImage: UIImage(systemName: "checkmark.seal"),
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
        buttonImage: model.buttonImage,
        buttonImageColor: model.buttonImageColor,
        buttonAction: {
          print("buttonAction")
        }
      )
    }
  }
}

