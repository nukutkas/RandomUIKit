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
    appearance.backgroundColor = RandomColor.primaryWhite
    appearance.titleTextAttributes = [.foregroundColor: RandomColor.primaryBlack]
    appearance.largeTitleTextAttributes = [.foregroundColor: RandomColor.primaryBlack]
    
    navigationController.navigationBar.tintColor = RandomColor.primaryBlack
    navigationController.navigationBar.standardAppearance = appearance
    navigationController.navigationBar.compactAppearance = appearance
    navigationController.navigationBar.scrollEdgeAppearance = appearance
    
    window.makeKeyAndVisible()
    window.rootViewController = navigationController
  }
}
