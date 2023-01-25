//
//  ColorsScreenInteractor.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit
import RandomUIKit

/// События которые отправляем из Interactor в Presenter
protocol ColorsScreenInteractorOutput: AnyObject {
  
  /// Были получены цвета
  func didRecive(cells: [ColorToken])
}

/// События которые отправляем от Presenter к Interactor
protocol ColorsScreenInteractorInput {
  
  /// Получаем список ячеек
  func getCells()
}

/// Интерактор
final class ColorsScreenInteractor: ColorsScreenInteractorInput {
  
  // MARK: - Internal properties
  
  weak var output: ColorsScreenInteractorOutput?
  
  // MARK: - Internal func
  
  func getCells() {
    let cells = ColorToken.allCases
    output?.didRecive(cells: cells)
  }
}
