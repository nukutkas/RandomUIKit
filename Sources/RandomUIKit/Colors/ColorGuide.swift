//
//  ColorGuide.swift
//
//
//  Created by Vitalii Sosin on 01.05.2022.
//

import UIKit

/// Гайд по цветам в приложении, для светлой и темной темы
public struct ColorGuide {
  
  /// Темно-серый цвет
  public let primaryGray = UIColor(light: .primaryGray, dark: .primaryWhite)
  
  /// Светло-серый цвет
  public let secondaryGray = UIColor(light: .secondaryGray, dark: .secondaryWhite)
  
  /// Очень светло-серый цвет
  public let tertiaryGray = UIColor(light: .tertiaryGray, dark: .tertiaryGray)
  
  /// Темно-зеленый цвет
  public let primaryGreen = UIColor(light: .primaryGreen, dark: .primaryGreen)
  
  /// Светло-зеленый цвет
  public let secondaryGreen = UIColor(light: .secondaryGreen, dark: .secondaryGreen)
  
  /// Очень светло-зеленый цвет
  public let tertiaryGreen = UIColor(light: .tertiaryGreen, dark: .secondaryGreen)
  
  /// Основной синий цвет
  public let primaryBlue = UIColor(light: .primaryBlue, dark: .primaryBlue)
  
  /// Ярко-красный цвет
  public let primaryRed = UIColor(light: .primaryRed, dark: .primaryRed)
  
  /// Светло-красный цвет
  public let secondaryRed = UIColor(light: .secondaryRed, dark: .secondaryRed)
  
  /// Светло-белый цвет
  public let primaryWhite = UIColor(light: .primaryWhite, dark: .darkApple)
  
  /// Темно-белый цвет
  public let secondaryWhite = UIColor(light: .secondaryWhite, dark: .primaryGray)
  
  /// Основной черный цвет
  public let primaryBlack = UIColor(light: .primaryBlack, dark: .primaryWhite)
  
  /// Темный цвет Apple
  public let darkApple = UIColor(light: .darkApple, dark: .darkApple)
}
