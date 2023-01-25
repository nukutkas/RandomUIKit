//
//  ColorsScreenViewController.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit
import RandomUIKit

/// События которые отправляем из `текущего модуля` в  `другой модуль`
protocol ColorsScreenModuleOutput: AnyObject {
    
}

/// События которые отправляем из `другого модуля` в  `текущий модуль`
protocol ColorsScreenModuleInput {
    
    /// События которые отправляем из `текущего модуля` в  `другой модуль`
    var moduleOutput: ColorsScreenModuleOutput? { get set }
}

/// Готовый модуль `ColorsScreenModule`
typealias ColorsScreenModule = UIViewController & ColorsScreenModuleInput

/// Презентер
final class ColorsScreenViewController: ColorsScreenModule {
    
    // MARK: - Internal properties
    
    weak var moduleOutput: ColorsScreenModuleOutput?
    
    // MARK: - Private properties
    
    private let interactor: ColorsScreenInteractorInput
    private let moduleView: ColorsScreenViewProtocol
    private let factory: ColorsScreenFactoryInput
    
    // MARK: - Initialization
    
    /// Инициализатор
    /// - Parameters:
    ///   - interactor: интерактор
    ///   - moduleView: вью
    ///   - factory: фабрика
    init(interactor: ColorsScreenInteractorInput,
         moduleView: ColorsScreenViewProtocol,
         factory: ColorsScreenFactoryInput) {
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

// MARK: - ColorsScreenViewOutput

extension ColorsScreenViewController: ColorsScreenViewOutput {
    
}

// MARK: - ColorsScreenInteractorOutput

extension ColorsScreenViewController: ColorsScreenInteractorOutput {
    func didRecive(cells: [ColorToken]) {
        moduleView.configure(with: cells)
    }
}

// MARK: - ColorsScreenFactoryOutput

extension ColorsScreenViewController: ColorsScreenFactoryOutput {
    
}

// MARK: - Appearance

private extension ColorsScreenViewController {
    struct Appearance {
        let title = "Цвета"
    }
}
