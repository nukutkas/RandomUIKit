//
//  FontsScreenCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit
import RandomUIKit

// MARK: - FontsScreenCell

enum FontsScreenCell: String {
    
    /// Жирный шрифт, размер 70
    case primaryBold70
    
    /// Жирный шрифт, размер 50
    case primaryBold50
    
    /// Жирный шрифт, размер 32
    case primaryBold32
    
    /// Жирный шрифт, размер 24
    case primaryBold24
    
    /// Жирный шрифт, размер 18
    case primaryBold18
    
    /// Жирный шрифт, размер 16
    case primaryBold16
    
    /// Жирный шрифт, размер 10
    case primaryBold10
    
    /// Полу-Жирный шрифт, размер 32
    case primaryMedium32
    
    /// Полу-Жирный шрифт, размер 24
    case primaryMedium24
    
    /// Полу-Жирный шрифт, размер 18
    case primaryMedium18
    
    /// Полу-Жирный шрифт, размер 16
    case primaryMedium16
    
    /// Полу-Жирный шрифт, размер 10
    case primaryMedium10
    
    /// Обычный шрифт, размер 32
    case primaryRegular32
    
    /// Обычный шрифт, размер 24
    case primaryRegular24
    
    /// Обычный шрифт, размер 18
    case primaryRegular18
    
    /// Обычный шрифт, размер 16
    case primaryRegular16
    
    /// Обычный шрифт, размер 10
    case primaryRegular10
    
    /// Тонкий шрифт, размер 48
    case primaryLight48
    
    // MARK: - Properties
    
    var font: UIFont {
        switch self {
        case .primaryBold70:
            return RandomFont.primaryBold70
        case .primaryBold50:
            return RandomFont.primaryBold50
        case .primaryBold32:
            return RandomFont.primaryBold32
        case .primaryBold24:
            return RandomFont.primaryBold24
        case .primaryBold18:
            return RandomFont.primaryBold18
        case .primaryBold16:
            return RandomFont.primaryBold16
        case .primaryBold10:
            return RandomFont.primaryBold10
        case .primaryMedium32:
            return RandomFont.primaryMedium32
        case .primaryMedium24:
            return RandomFont.primaryMedium24
        case .primaryMedium18:
            return RandomFont.primaryMedium18
        case .primaryMedium16:
            return RandomFont.primaryMedium16
        case .primaryMedium10:
            return RandomFont.primaryMedium10
        case .primaryRegular32:
            return RandomFont.primaryRegular32
        case .primaryRegular24:
            return RandomFont.primaryRegular24
        case .primaryRegular18:
            return RandomFont.primaryRegular18
        case .primaryRegular16:
            return RandomFont.primaryRegular16
        case .primaryRegular10:
            return RandomFont.primaryRegular10
        case .primaryLight48:
            return RandomFont.primaryLight48
        }
    }
}

// MARK: - CaseIterable

extension FontsScreenCell: CaseIterable { }
