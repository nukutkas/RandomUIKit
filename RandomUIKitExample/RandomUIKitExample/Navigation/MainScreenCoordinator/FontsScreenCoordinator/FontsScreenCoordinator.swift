//
//  FontsScreenCoordinator.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit

final class FontsScreenCoordinator: Coordinator {
    
    // MARK: - Private variables
    
    private let navigationController: UINavigationController
    private var fontsScreenModule: FontsScreenModule?
    
    // MARK: - Initialization
    
    /// - Parameters:
    ///   - navigationController: UINavigationController
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Internal func
    
    func start() {
        let fontsScreenModule = FontsScreenAssembly().createModule()
        self.fontsScreenModule = fontsScreenModule
        self.fontsScreenModule?.moduleOutput = self
        navigationController.pushViewController(fontsScreenModule, animated: true)
    }
}

// MARK: - FontsScreenModuleOutput

extension FontsScreenCoordinator: FontsScreenModuleOutput {
    
}
