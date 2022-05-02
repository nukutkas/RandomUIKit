//
//  CellsScreenInteractor.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit

/// События которые отправляем из Interactor в Presenter
protocol CellsScreenInteractorOutput: AnyObject {
    
    /// Были получены ячейки
    func didRecive(cells: [CellsScreenCell])
}

/// События которые отправляем от Presenter к Interactor
protocol CellsScreenInteractorInput {
    
    /// Получаем список ячеек
    func getCells()
}

/// Интерактор
final class CellsScreenInteractor: CellsScreenInteractorInput {
    
    // MARK: - Internal properties
    
    weak var output: CellsScreenInteractorOutput?
    
    // MARK: - Internal func
    
    func getCells() {
        let cells = CellsScreenCell.allCases
        output?.didRecive(cells: cells)
    }
}
