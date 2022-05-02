//
//  ColorsScreenAssembly.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit

/// Сборщик `ColorsScreen`
final class ColorsScreenAssembly {
    
    /// Собирает модуль `ColorsScreen`
    /// - Returns: Cобранный модуль `ColorsScreen`
    func createModule() -> ColorsScreenModule {
        
        let interactor = ColorsScreenInteractor()
        let view = ColorsScreenView()
        let factory = ColorsScreenFactory()
        
        let presenter = ColorsScreenViewController(interactor: interactor, moduleView: view, factory: factory)
        
        view.output = presenter
        interactor.output = presenter
        factory.output = presenter
        return presenter
    }
}
