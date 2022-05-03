//
//  MainScreenViewController.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 01.05.2022.
//

import UIKit

/// События которые отправляем из `текущего модуля` в  `другой модуль`
protocol MainScreenModuleOutput: AnyObject {
    
    /// Открыть раздел `Colors`
    func openColors()
    
    /// Открыть раздел `Fonts`
    func openFonts()
    
    /// Открыть раздел `Cells & Views`
    func openCells()
}

/// События которые отправляем из `другого модуля` в  `текущий модуль`
protocol MainScreenModuleInput {
    
    /// События которые отправляем из `текущего модуля` в  `другой модуль`
    var moduleOutput: MainScreenModuleOutput? { get set }
}

/// Готовый модуль `MainScreenModule`
typealias MainScreenModule = UIViewController & MainScreenModuleInput

/// Презентер
final class MainScreenViewController: MainScreenModule {
    
    // MARK: - Internal properties
    
    weak var moduleOutput: MainScreenModuleOutput?
    
    // MARK: - Private properties
    
    private let interactor: MainScreenInteractorInput
    private let moduleView: MainScreenViewProtocol
    private let factory: MainScreenFactoryInput
    
    // MARK: - Initialization
    
    /// Инициализатор
    /// - Parameters:
    ///   - interactor: интерактор
    ///   - moduleView: вью
    ///   - factory: фабрика
    init(interactor: MainScreenInteractorInput,
         moduleView: MainScreenViewProtocol,
         factory: MainScreenFactoryInput) {
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
        navigationController?.navigationBar.prefersLargeTitles = true
        interactor.getCells()
    }
}

// MARK: - MainScreenViewOutput

extension MainScreenViewController: MainScreenViewOutput {
    func openColors() {
        moduleOutput?.openColors()
    }
    
    func openFonts() {
        moduleOutput?.openFonts()
    }
    
    func openCells() {
        moduleOutput?.openCells()
    }
}

// MARK: - MainScreenInteractorOutput

extension MainScreenViewController: MainScreenInteractorOutput {
    func didRecive(cells: [MainScreenCell]) {
        moduleView.configureWith(cells: cells)
    }
}

// MARK: - MainScreenFactoryOutput

extension MainScreenViewController: MainScreenFactoryOutput {
    
}

// MARK: - Appearance

private extension MainScreenViewController {
    struct Appearance {
        let title = "RandomUIKit"
    }
}
