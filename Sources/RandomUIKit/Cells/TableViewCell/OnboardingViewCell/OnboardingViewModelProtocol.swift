//
//  OnboardingViewModel.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 15.01.2023.
//

import Foundation

public protocol OnboardingViewModelProtocol {
  
  var pageModels: [OnboardingViewPageModelProtocol] { get }
  
  /// Событие при изменение экрана
  var didChangePageAction: ((_ currentPage: Int) -> Void)? { get set }
}

public protocol OnboardingViewPageModelProtocol {
  
  /// Заголовок
  var title: String? { get }
  
  /// Описание
  var description: String? { get }
  
  /// Имя JSON анимированного файла
  var lottieAnimationJSONName: String { get }
}
