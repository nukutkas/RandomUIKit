//
//  FontsScreenFactory.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit

/// Cобытия которые отправляем из Factory в Presenter
protocol FontsScreenFactoryOutput: AnyObject {
    
}

/// Cобытия которые отправляем от Presenter к Factory
protocol FontsScreenFactoryInput {
    
}

/// Фабрика
final class FontsScreenFactory: FontsScreenFactoryInput {
    
    // MARK: - Internal properties
    
    weak var output: FontsScreenFactoryOutput?
    
    // MARK: - Private properties
    
}

// MARK: - Appearance

private extension FontsScreenFactory {
    struct Appearance {
        
    }
}
