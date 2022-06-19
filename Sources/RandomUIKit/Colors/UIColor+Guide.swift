//
//  UIColor+Guide.swift
//
//
//  Created by Vitalii Sosin on 01.05.2022.
//

import UIKit

/// Расширение для `UIColor`
public extension UIColor {
  
  /// Список цветов `RandomColor`
  class var randomColor: ColorGuide { colorGuide }
}

// MARK: - Public property

public var RandomColor: ColorGuide { colorGuide }

// MARK: - Private property

private let colorGuide = ColorGuide()
