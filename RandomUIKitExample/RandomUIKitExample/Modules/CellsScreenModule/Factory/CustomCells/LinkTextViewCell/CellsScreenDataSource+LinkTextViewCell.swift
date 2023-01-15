//
//  CellsScreenDataSource+LinkTextViewCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 15.01.2023.
//

import UIKit
import RandomUIKit

// MARK: - LinkTextViewCellModel

/// Моделька для ячейки
struct LinkTextViewCellModel: CellModel {
  let fullText: String?
  let fullTextColor: UIColor?
  let fullTextFont: UIFont?
  let fullTextAlignment: NSTextAlignment?
  let links: [String: String]
  let linkColor: UIColor?
  var actionLinkTap: ((URL) -> Bool)?
  
  var titleCell: String = ""
  var reuseIdentifier = CellsScreenCell.linkTextViewCell.reuseIdentifier
}

extension CellsScreenDataSource where Model == LinkTextViewCellModel {
  static func makeForLinkTextViewCell() -> CellsScreenDataSource {
    let termsConditionsKey = "Terms & Conditions"
    let privacyPolicyKey = "Privacy Policy"
    
    let termsAndConditionsLink = "https://sosinvitalii.com/terms-conditions"
    let privacyPolicyLink = "https://sosinvitalii.com/privacy-policy"
    
    let models = [
      LinkTextViewCellModel(fullText: "Terms & Conditions and Privacy Policy",
                            fullTextColor: nil,
                            fullTextFont: nil,
                            fullTextAlignment: nil,
                            links: [
                              termsConditionsKey: termsAndConditionsLink,
                              privacyPolicyKey: privacyPolicyLink
                            ],
                            linkColor: nil,
                            actionLinkTap: { url in
                              print("actionLinkTap \(url)")
                              return true
                            })
    ]
    
    return CellsScreenDataSource(models: models) { (model, cell) in
      guard let cell = cell as? LinkTextViewCell else {
        return
      }
      
      cell.configureCellWith(fullText: model.fullText,
                             fullTextColor: model.fullTextColor,
                             fullTextFont: model.fullTextFont,
                             fullTextAlignment: model.fullTextAlignment,
                             links: model.links,
                             linkColor: model.linkColor,
                             actionLinkTap: model.actionLinkTap)
    }
  }
}
