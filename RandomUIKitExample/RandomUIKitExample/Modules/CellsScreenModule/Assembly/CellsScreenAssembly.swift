//
//  CellsScreenAssembly.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit

/// Сборщик `CellsScreen`
final class CellsScreenAssembly {
    
    /// Собирает модуль `CellsScreen`
    ///  - Parameter keyboardService: Сервис "Слушатель клавиатуры"
    /// - Returns: Cобранный модуль `CellsScreen`
    func createModule(keyboardService: KeyboardService) -> CellsScreenModule {
        
        let interactor = CellsScreenInteractor()
        let view = CellsScreenView()
        let factory = CellsScreenFactory()
        
        let presenter = CellsScreenViewController(interactor: interactor, moduleView: view, factory: factory)
        
        view.output = presenter
        view.keyboardService = keyboardService
        interactor.output = presenter
        factory.output = presenter
        return presenter
    }
}
