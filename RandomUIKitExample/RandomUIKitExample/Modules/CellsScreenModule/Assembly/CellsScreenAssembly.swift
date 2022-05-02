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
    /// - Returns: Cобранный модуль `CellsScreen`
    func createModule() -> CellsScreenModule {
        
        let interactor = CellsScreenInteractor()
        let view = CellsScreenView()
        let factory = CellsScreenFactory()
        
        let presenter = CellsScreenViewController(interactor: interactor, moduleView: view, factory: factory)
        
        view.output = presenter
        interactor.output = presenter
        factory.output = presenter
        return presenter
    }
}
