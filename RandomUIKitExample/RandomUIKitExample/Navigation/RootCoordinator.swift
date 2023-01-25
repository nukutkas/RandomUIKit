//
//  RootCoordinator.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 01.05.2022.
//

import UIKit
import RandomUIKit

final class RootCoordinator: Coordinator {
  
  // MARK: - Private variables
  
  private let window: UIWindow
  private let navigationController = UINavigationController()
  private var mainScreenCoordinator: Coordinator?
  private let keyboardService: KeyboardService = DefaultKeyboardService()
  
  // MARK: - Initialization
  
  /// - Parameter window: UIWindow
  init(window: UIWindow) {
    self.window = window
  }
  
  // MARK: - Internal func
  
  func start() {
    let mainScreenCoordinator: Coordinator = MainScreenCoordinator(navigationController,
                                                                   keyboardService: keyboardService)
    self.mainScreenCoordinator = mainScreenCoordinator
    mainScreenCoordinator.start()
    
    let appearance = UINavigationBarAppearance()
    appearance.backgroundColor = RandomColor.darkAndLightTheme.primaryWhite
    appearance.titleTextAttributes = [.foregroundColor: RandomColor.darkAndLightTheme.primaryBlack]
    appearance.largeTitleTextAttributes = [.foregroundColor: RandomColor.darkAndLightTheme.primaryBlack]
    
    navigationController.navigationBar.tintColor = RandomColor.darkAndLightTheme.primaryBlack
    navigationController.navigationBar.standardAppearance = appearance
    navigationController.navigationBar.compactAppearance = appearance
    navigationController.navigationBar.scrollEdgeAppearance = appearance
    
    window.makeKeyAndVisible()
    window.rootViewController = navigationController
  }
}
