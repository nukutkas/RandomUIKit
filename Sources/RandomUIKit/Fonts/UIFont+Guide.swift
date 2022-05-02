//
//  UIFont+Guide.swift
//
//  Created by Vitalii Sosin on 01.05.2022.
//

import UIKit

/// Расширение для `UIFont`
public extension UIFont {
    
    /// Список цветов `RandomFont`
    class var randomFont: FontGuide { fontGuide }
}

// MARK: - Public property

public var RandomFont: FontGuide { fontGuide }

// MARK: - Private property

private let fontGuide = FontGuide()
