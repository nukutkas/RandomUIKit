//
//  CellsScreenFactory.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit

/// Cобытия которые отправляем из Factory в Presenter
protocol CellsScreenFactoryOutput: AnyObject {
    
}

/// Cобытия которые отправляем от Presenter к Factory
protocol CellsScreenFactoryInput {
    
}

/// Фабрика
final class CellsScreenFactory: CellsScreenFactoryInput {
    
    // MARK: - Internal properties
    
    weak var output: CellsScreenFactoryOutput?
    
    // MARK: - Private properties
    
}

// MARK: - Appearance

private extension CellsScreenFactory {
    struct Appearance {
        
    }
}
