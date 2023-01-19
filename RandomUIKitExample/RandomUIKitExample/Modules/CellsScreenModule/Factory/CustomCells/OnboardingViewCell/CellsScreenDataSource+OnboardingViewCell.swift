//
//  CellsScreenDataSource+OnboardingViewCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 15.01.2023.
//

import UIKit
import RandomUIKit

// MARK: - OnboardingViewCellModelExample

/// Моделька для ячейки
struct OnboardingViewCellModelExample: CellModel {
  
  var titleCell: String = ""
  var reuseIdentifier = CellsScreenCell.onboardingViewCell.reuseIdentifier
}

extension CellsScreenDataSource where Model == OnboardingViewCellModelExample {
  static func makeForOnboardingViewCellModel() -> CellsScreenDataSource {
    let model = OnboardingViewModel(pageModels: [
      
      OnboardingViewModel.PageModel(title: "Search History dsjkn klmvwevwsevsvsevewgf",
                                    description: "Transfer obfuscate traffic via encrypted tunneltunneltunneltunneltunneltunneltunneltunneltunneltunnel",
                                    lottieAnimationJSONName: "test-animate_one"),
      OnboardingViewModel.PageModel(title: "Search History",
                                    description: "Transfer obfuscate traffic via encrypted tunnel",
                                    lottieAnimationJSONName: "test-animate_two"),
      OnboardingViewModel.PageModel(title: "Search History",
                                    description: "Transfer obfuscate traffic via encrypted tunneltunneltunneltunnel",
                                    lottieAnimationJSONName: "test-animate_three")
    ],
                                    didChangePageAction: { currentPage in
      print("Экран изменился на \(currentPage)")
    })
    
    return CellsScreenDataSource(models: [OnboardingViewCellModelExample()]) { (_, cell) in
      guard let cell = cell as? OnboardingViewCell else {
        return
      }
      
      cell.configureCellWith(model)
      
    }
  }
}
