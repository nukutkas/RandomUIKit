//
//  CellsScreenDataSource+OnboardingViewCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 15.01.2023.
//

import UIKit
import RandomUIKit

// MARK: - OnboardingViewCellModel

/// Моделька для ячейки
struct OnboardingViewCellModel: CellModel, OnboardingViewModel {
 
  var title: String?
  var description: String?
  var lottieAnimationJSONName: String = ""
  
  var titleCell: String = ""
  var reuseIdentifier = CellsScreenCell.onboardingViewCell.reuseIdentifier
}

extension CellsScreenDataSource where Model == OnboardingViewCellModel {
  static func makeForOnboardingViewCellModel() -> CellsScreenDataSource {
    let models = [
      OnboardingViewCellModel(title: "Search History",
                              description: "Transfer obfuscate traffic via encrypted tunnel",
                              lottieAnimationJSONName: "test-animate_one"),
      OnboardingViewCellModel(title: "Search History",
                              description: "Transfer obfuscate traffic via encrypted tunnel",
                              lottieAnimationJSONName: "test-animate_two"),
      OnboardingViewCellModel(title: "Search History",
                              description: "Transfer obfuscate traffic via encrypted tunnel",
                              lottieAnimationJSONName: "test-animate_three")
    ]
    
    return CellsScreenDataSource(models: [OnboardingViewCellModel()]) { (_, cell) in
      guard let cell = cell as? OnboardingViewCell else {
        return
      }
      
      cell.configureCellWith(models)
      
    }
  }
}
