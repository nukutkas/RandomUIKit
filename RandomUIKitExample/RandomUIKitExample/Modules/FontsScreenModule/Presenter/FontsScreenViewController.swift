//
//  FontsScreenViewController.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit
import RandomUIKit

/// События которые отправляем из `текущего модуля` в  `другой модуль`
protocol FontsScreenModuleOutput: AnyObject {}

/// События которые отправляем из `другого модуля` в  `текущий модуль`
protocol FontsScreenModuleInput {
    
    /// События которые отправляем из `текущего модуля` в  `другой модуль`
    var moduleOutput: FontsScreenModuleOutput? { get set }
}

/// Готовый модуль `FontsScreenModule`
typealias FontsScreenModule = UIViewController & FontsScreenModuleInput

/// Презентер
final class FontsScreenViewController: FontsScreenModule {
    
    // MARK: - Internal properties
    
    weak var moduleOutput: FontsScreenModuleOutput?
    
    // MARK: - Private properties
    
    private let interactor: FontsScreenInteractorInput
    private let moduleView: FontsScreenViewProtocol
    private let factory: FontsScreenFactoryInput
    
    // MARK: - Initialization
    
    /// Инициализатор
    /// - Parameters:
    ///   - interactor: интерактор
    ///   - moduleView: вью
    ///   - factory: фабрика
    init(interactor: FontsScreenInteractorInput,
         moduleView: FontsScreenViewProtocol,
         factory: FontsScreenFactoryInput) {
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

// MARK: - FontsScreenViewOutput

extension FontsScreenViewController: FontsScreenViewOutput {
    
}

// MARK: - FontsScreenInteractorOutput

extension FontsScreenViewController: FontsScreenInteractorOutput {
    func didRecive(fonts: [FontToken]) {
        moduleView.configure(with: fonts)
    }
}

// MARK: - FontsScreenFactoryOutput

extension FontsScreenViewController: FontsScreenFactoryOutput {
    
}

// MARK: - Appearance

private extension FontsScreenViewController {
    struct Appearance {
        let title = "Шрифты"
    }
}
