//
//  ColorsScreenCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit
import RandomUIKit

/// Список цветов
enum ColorsScreenCell: String {
  
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
  
  /// Светло-красный цвет
  case secondaryRed
  
  /// Темно-белый цвет
  case primaryWhite
  
  /// Светло-белый цвет
  case secondaryWhite
  
  /// Основной черный цвет
  case primaryBlack
  
  // MARK: - Properties
  
  /// Текущий цвет
  var color: UIColor {
    switch self {
    case .primaryGray:
      return RandomColor.primaryGray
    case .secondaryGray:
      return RandomColor.secondaryGray
    case .tertiaryGray:
      return RandomColor.tertiaryGray
    case .primaryGreen:
      return RandomColor.primaryGreen
    case .secondaryGreen:
      return RandomColor.secondaryGreen
    case .tertiaryGreen:
      return RandomColor.tertiaryGreen
    case .primaryBlue:
      return RandomColor.primaryBlue
    case .primaryRed:
      return RandomColor.primaryRed
    case .secondaryRed:
      return RandomColor.secondaryRed
    case .primaryWhite:
      return RandomColor.primaryWhite
    case .secondaryWhite:
      return RandomColor.secondaryWhite
    case .primaryBlack:
      return RandomColor.primaryBlack
    }
  }
}

// MARK: - CaseIterable

extension ColorsScreenCell: CaseIterable { }
