//
//  FontsScreenInteractor.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit
import RandomUIKit

/// События которые отправляем из Interactor в Presenter
protocol FontsScreenInteractorOutput: AnyObject {
    
    /// Были получены шрифты
    func didRecive(fonts: [FontToken])
}

/// События которые отправляем от Presenter к Interactor
protocol FontsScreenInteractorInput {
    
    /// Получаем список ячеек
    func getCells()
}

/// Интерактор
final class FontsScreenInteractor: FontsScreenInteractorInput {
    
    // MARK: - Internal properties
    
    weak var output: FontsScreenInteractorOutput?
    
    // MARK: - Internal func
    
    func getCells() {
        let fonts = FontToken.allCases
        output?.didRecive(fonts: fonts)
    }
}
