//
//  FontsScreenAssembly.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit

/// Сборщик `FontsScreen`
final class FontsScreenAssembly {
    
    /// Собирает модуль `FontsScreen`
    /// - Returns: Cобранный модуль `FontsScreen`
    func createModule() -> FontsScreenModule {
        
        let interactor = FontsScreenInteractor()
        let view = FontsScreenView()
        let factory = FontsScreenFactory()
        
        let presenter = FontsScreenViewController(interactor: interactor, moduleView: view, factory: factory)
        
        view.output = presenter
        interactor.output = presenter
        factory.output = presenter
        return presenter
    }
}
