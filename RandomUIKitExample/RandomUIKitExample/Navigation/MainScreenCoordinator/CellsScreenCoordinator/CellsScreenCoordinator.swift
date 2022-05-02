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
    
    // MARK: - Initialization
    
    /// - Parameters:
    ///   - navigationController: UINavigationController
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Internal func
    
    func start() {
        let cellsScreenModule = CellsScreenAssembly().createModule()
        self.cellsScreenModule = cellsScreenModule
        self.cellsScreenModule?.moduleOutput = self
        navigationController.pushViewController(cellsScreenModule, animated: true)
    }
}

// MARK: - CellsScreenModuleOutput

extension CellsScreenCoordinator: CellsScreenModuleOutput {
    
}
