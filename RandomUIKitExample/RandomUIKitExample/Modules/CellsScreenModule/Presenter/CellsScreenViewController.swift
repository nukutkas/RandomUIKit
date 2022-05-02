//
//  CellsScreenViewController.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit

/// События которые отправляем из `текущего модуля` в  `другой модуль`
protocol CellsScreenModuleOutput: AnyObject {
    
}

/// События которые отправляем из `другого модуля` в  `текущий модуль`
protocol CellsScreenModuleInput {
    
    /// События которые отправляем из `текущего модуля` в  `другой модуль`
    var moduleOutput: CellsScreenModuleOutput? { get set }
}

/// Готовый модуль `CellsScreenModule`
typealias CellsScreenModule = UIViewController & CellsScreenModuleInput

/// Презентер
final class CellsScreenViewController: CellsScreenModule {
    
    // MARK: - Internal properties
    
    weak var moduleOutput: CellsScreenModuleOutput?
    
    // MARK: - Private properties
    
    private let interactor: CellsScreenInteractorInput
    private let moduleView: CellsScreenViewProtocol
    private let factory: CellsScreenFactoryInput
    
    // MARK: - Initialization
    
    /// Инициализатор
    /// - Parameters:
    ///   - interactor: интерактор
    ///   - moduleView: вью
    ///   - factory: фабрика
    init(interactor: CellsScreenInteractorInput,
         moduleView: CellsScreenViewProtocol,
         factory: CellsScreenFactoryInput) {
        self.interactor = interactor
        self.moduleView = moduleView
        self.factory = factory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func loadView() {
        view = moduleView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Appearance().title
        interactor.getCells()
    }
}

// MARK: - CellsScreenViewOutput

extension CellsScreenViewController: CellsScreenViewOutput {
    
}

// MARK: - CellsScreenInteractorOutput

extension CellsScreenViewController: CellsScreenInteractorOutput {
    func didRecive(cells: [CellsScreenCell]) {
        moduleView.configure(with: cells)
    }
}

// MARK: - CellsScreenFactoryOutput

extension CellsScreenViewController: CellsScreenFactoryOutput {
    
}

// MARK: - Appearance

private extension CellsScreenViewController {
    struct Appearance {
        let title = "Ячейки для Таблички"
    }
}
