//
//  CellsScreenDataSource+OnboardingViewCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 15.01.2023.
//

import UIKit
import RandomUIKit

// MARK: - OnboardingViewCellModel

struct OnboardingViewPageCellModel: OnboardingViewPageModelProtocol {
  var title: String?
  var description: String?
  var lottieAnimationJSONName: String
}

/// Моделька для ячейки
struct OnboardingViewCellModel: CellModel, OnboardingViewModelProtocol {
  var pageModels: [OnboardingViewPageModelProtocol]
  var didChangePageAction: ((Int) -> Void)?
  
  var titleCell: String = ""
  var reuseIdentifier = CellsScreenCell.onboardingViewCell.reuseIdentifier
}

extension CellsScreenDataSource where Model == OnboardingViewCellModel {
  static func makeForOnboardingViewCellModel() -> CellsScreenDataSource {
    let model = OnboardingViewCellModel(pageModels: [
      OnboardingViewPageCellModel(title: "Search History",
                                  description: "Transfer obfuscate traffic via encrypted tunnel",
                                  lottieAnimationJSONName: "test-animate_one"),
      OnboardingViewPageCellModel(title: "Search History",
                                  description: "Transfer obfuscate traffic via encrypted tunnel",
                                  lottieAnimationJSONName: "test-animate_two"),
      OnboardingViewPageCellModel(title: "Search History",
                                  description: "Transfer obfuscate traffic via encrypted tunnel",
                                  lottieAnimationJSONName: "test-animate_three")
    ],
                                        didChangePageAction: { currentPage in
      print("Экран изменился на \(currentPage)")
    })
    
    return CellsScreenDataSource(models: [OnboardingViewCellModel(pageModels: [])]) { (_, cell) in
      guard let cell = cell as? OnboardingViewCell else {
        return
      }
      
      cell.configureCellWith(model)
      
    }
  }
}
