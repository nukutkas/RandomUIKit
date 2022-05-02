//
//  MainScreenCoordinator.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 01.05.2022.
//

import UIKit

final class MainScreenCoordinator: Coordinator {
    
    // MARK: - Private variables
    
    private let navigationController: UINavigationController
    private var mainScreenModule: MainScreenModule?
    private var colorsScreenCoordinator: Coordinator?
    private var fontsScreenCoordinator: Coordinator?
    private var cellsScreenCoordinator: Coordinator?
    
    // MARK: - Initialization
    
    /// - Parameters:
    ///   - navigationController: UINavigationController
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Internal func
    
    func start() {
        let mainScreenModule = MainScreenAssembly().createModule()
        self.mainScreenModule = mainScreenModule
        self.mainScreenModule?.moduleOutput = self
        navigationController.pushViewController(mainScreenModule, animated: true)
    }
}

// MARK: - Private

private extension MainScreenCoordinator {
    func presentColorsScreenCoordinator() {
        let colorsScreenCoordinator: Coordinator = ColorsScreenCoordinator(navigationController)
        self.colorsScreenCoordinator = colorsScreenCoordinator
        colorsScreenCoordinator.start()
    }
    
    func presentFontsScreenCoordinator() {
        let fontsScreenCoordinator: Coordinator = FontsScreenCoordinator(navigationController)
        self.fontsScreenCoordinator = fontsScreenCoordinator
        fontsScreenCoordinator.start()
    }
    
    func presentCellsScreenCoordinator() {
        let cellsScreenCoordinator: Coordinator = CellsScreenCoordinator(navigationController)
        self.cellsScreenCoordinator = cellsScreenCoordinator
        cellsScreenCoordinator.start()
    }
}

// MARK: - MainScreenModuleOutput

extension MainScreenCoordinator: MainScreenModuleOutput {
    func openColors() {
        presentColorsScreenCoordinator()
    }
    
    func openFonts() {
        presentFontsScreenCoordinator()
    }
    
    func openCells() {
        presentCellsScreenCoordinator()
    }
}
