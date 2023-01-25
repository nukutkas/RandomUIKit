//
//  ColorGuide.swift
//
//
//  Created by Vitalii Sosin on 01.05.2022.
//

import UIKit

/// Гайд по цветам в приложении, для светлой и темной темы
public struct ColorGuide {
  
  /// Цвета для темной и светлой темы
  public let darkAndLightTheme: DarkAndLightTheme
  
  /// Только определенный цвет
  public let only: Only
  
  // MARK: - Only
  
  /// Только конкретный цвет
  public struct Only {
    
    /// Темно-серый цвет
    public let primaryGray = UIColor(hexString: ColorToken.primaryGray.hexString)
    
    /// Светло-серый цвет
    public let secondaryGray = UIColor(hexString: ColorToken.secondaryGray.hexString)
    
    /// Очень светло-серый цвет
    public let tertiaryGray = UIColor(hexString: ColorToken.tertiaryGray.hexString)
    
    /// Темно-зеленый цвет
    public let primaryGreen = UIColor(hexString: ColorToken.primaryGreen.hexString)
    
    /// Светло-зеленый цвет
    public let secondaryGreen = UIColor(hexString: ColorToken.secondaryGreen.hexString)
    
    /// Очень светло-зеленый цвет
    public let tertiaryGreen = UIColor(hexString: ColorToken.tertiaryGreen.hexString)
    
    /// Основной синий цвет
    public let primaryBlue = UIColor(hexString: ColorToken.primaryBlue.hexString)
    
    /// Ярко-красный цвет
    public let primaryRed = UIColor(hexString: ColorToken.primaryRed.hexString)
    
    /// Основной розовый цвет
    public let primaryPink = UIColor(hexString: ColorToken.primaryPink.hexString)
    
    /// Светло-белый цвет
    public let primaryWhite = UIColor(hexString: ColorToken.primaryWhite.hexString)
    
    /// Темно-белый цвет
    public let secondaryWhite = UIColor(hexString: ColorToken.secondaryWhite.hexString)
    
    /// Основной черный цвет
    public let primaryBlack = UIColor(hexString: ColorToken.primaryBlack.hexString)
    
    /// Темный цвет Apple
    public let darkApple = UIColor(hexString: ColorToken.darkApple.hexString)
  }
  
  // MARK: - DarkAndLightTheme
  
  /// Темная и светлая тема
  public struct DarkAndLightTheme {
    
    /// Темно-серый цвет
    public let primaryGray = UIColor(light: .primaryGray, dark: .primaryWhite)
    
    /// Светло-серый цвет
    public let secondaryGray = UIColor(light: .secondaryGray, dark: .secondaryWhite)
    
    /// Очень светло-зеленый цвет
    public let tertiaryGreen = UIColor(light: .tertiaryGreen, dark: .secondaryGreen)
    
    /// Светло-белый цвет
    public let primaryWhite = UIColor(light: .primaryWhite, dark: .darkApple)
    
    /// Темно-белый цвет
    public let secondaryWhite = UIColor(light: .secondaryWhite, dark: .primaryGray)
    
    /// Основной черный цвет
    public let primaryBlack = UIColor(light: .primaryBlack, dark: .primaryWhite)
  }
}
