//
//  ColorToken.swift
//  
//
//  Created by Vitalii Sosin on 01.05.2022.
//

import UIKit

/// Список цветов
public enum ColorToken: CaseIterable {
  
  /// Заголовок цвета
  public var title: String {
    switch self {
    case .primaryGray:
      return "Primary Gray"
    case .secondaryGray:
      return "Secondary Gray"
    case .tertiaryGray:
      return "Tertiary Gray"
    case .primaryGreen:
      return "Primary Green"
    case .secondaryGreen:
      return "Secondary Green"
    case .tertiaryGreen:
      return "Tertiary Green"
    case .primaryBlue:
      return "Primary Blue"
    case .primaryRed:
      return "Primary Red"
    case .primaryPink:
      return "Primary Pink"
    case .primaryWhite:
      return "Primary White"
    case .secondaryWhite:
      return "Secondary White"
    case .primaryBlack:
      return "Primary Black"
    case .darkApple:
      return "Dark Apple"
    }
  }
  
  /// Hex цвета
  public var hexString: String {
    switch self {
    case .primaryGray:
      return "434A65"
    case .secondaryGray:
      return "8D91AA"
    case .tertiaryGray:
      return "F3F3F6"
    case .primaryGreen:
      return "03ACB1"
    case .secondaryGreen:
      return "02CBAB"
    case .tertiaryGreen:
      return "EBF6F0"
    case .primaryBlue:
      return "007AFF"
    case .primaryRed:
      return "FF473A"
    case .primaryPink:
      return "E87AA4"
    case .primaryWhite:
      return "FFFFFF"
    case .secondaryWhite:
      return "F6F6F8"
    case .primaryBlack:
      return "000000"
    case .darkApple:
      return "292A2F"
    }
  }
  
  /// Темно-серый цвет
  case primaryGray
  
  /// Светло-серый цвет
  case secondaryGray
  
  /// Очень светло-серый цвет
  case tertiaryGray
  
  /// Темно-зеленый цвет
  case primaryGreen
  
  /// Светло-зеленый цвет
  case secondaryGreen
  
  /// Очень светло-зеленый цвет
  case tertiaryGreen
  
  /// Основной синий цвет
  case primaryBlue
  
  /// Ярко-красный цвет
  case primaryRed
  
  /// Основной розовый цвет
  case primaryPink
  
  /// Светло-белый цвет
  case primaryWhite
  
  /// Темно-белый цвет
  case secondaryWhite
  
  /// Основной черный цвет
  case primaryBlack
  
  /// Темный цвет Apple
  case darkApple
}
