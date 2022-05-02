//
//  ColorsScreenCoordinator.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit

final class ColorsScreenCoordinator: Coordinator {
    
    // MARK: - Private variables
    
    private let navigationController: UINavigationController
    private var colorsScreenModule: ColorsScreenModule?
    
    // MARK: - Initialization
    
    /// - Parameters:
    ///   - navigationController: UINavigationController
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Internal func
    
    func start() {
        let colorsScreenModule = ColorsScreenAssembly().createModule()
        self.colorsScreenModule = colorsScreenModule
        self.colorsScreenModule?.moduleOutput = self
        navigationController.pushViewController(colorsScreenModule, animated: true)
    }
}

// MARK: - ColorsScreenModuleOutput

extension ColorsScreenCoordinator: ColorsScreenModuleOutput {
    
}
