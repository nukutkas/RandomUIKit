//
//  CellsScreenCoordinator.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit

final class CellsScreenCoordinator: Coordinator {
    
    // MARK: - Private variables
    
    private let navigationController: UINavigationController
    private var cellsScreenModule: CellsScreenModule?
    private let keyboardService: KeyboardService
    
    // MARK: - Initialization
    
    /// - Parameters:
    ///   - navigationController: UINavigationController
    ///   - keyboardService: Сервис "Слушатель клавиатуры"
    init(_ navigationController: UINavigationController,
         keyboardService: KeyboardService) {
        self.navigationController = navigationController
        self.keyboardService = keyboardService
    }
    
    // MARK: - Internal func
    
    func start() {
        let cellsScreenModule = CellsScreenAssembly().createModule(keyboardService: keyboardService)
        self.cellsScreenModule = cellsScreenModule
        self.cellsScreenModule?.moduleOutput = self
        navigationController.pushViewController(cellsScreenModule, animated: true)
    }
}

// MARK: - CellsScreenModuleOutput

extension CellsScreenCoordinator: CellsScreenModuleOutput {
    
}
