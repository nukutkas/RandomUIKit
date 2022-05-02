//
//  ColorsScreenFactory.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit

/// Cобытия которые отправляем из Factory в Presenter
protocol ColorsScreenFactoryOutput: AnyObject {
    
}

/// Cобытия которые отправляем от Presenter к Factory
protocol ColorsScreenFactoryInput {
    
}

/// Фабрика
final class ColorsScreenFactory: ColorsScreenFactoryInput {
    
    // MARK: - Internal properties
    
    weak var output: ColorsScreenFactoryOutput?
    
    // MARK: - Private properties
    
}

// MARK: - Appearance

private extension ColorsScreenFactory {
    struct Appearance {
        
    }
}
