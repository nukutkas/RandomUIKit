//
//  CellsScreenCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit

// MARK: - CellsScreenCell

enum CellsScreenCell: String {
    
    // MARK: - Cases
    
    /// Основная карточка на главном экране
    case mainCardTableViewCell
    
    /// Рекламный лайбл
    case labelGradientView
    
    /// Основная кнопка
    case button
    
    /// Текстовое поле
    case textField
    
    /// Список элементов в формате `String`
    case scrollLabelGradientView
    
    var reuseIdentifier: String {
        return cellClass.description()
    }
    
    var cellClass: UITableViewCell.Type {
        switch self {
        case .mainCardTableViewCell:
            return MainCardTableViewCell.self
        case .labelGradientView:
            return LabelGradientTableViewCell.self
        case .button:
            return ButtonTableViewCell.self
        case .textField:
            return TextFieldTableViewCell.self
        case .scrollLabelGradientView:
            return ScrollLabelGradientTableViewCell.self
        }
    }
    
    var dataSource: UITableViewDataSource? {
        switch self {
        case .mainCardTableViewCell:
            return CellsScreenDataSource.makeForMainCard()
        case .labelGradientView:
            return CellsScreenDataSource.makeForLabelGradient()
        case .button:
            return CellsScreenDataSource.makeForButton()
        case .textField:
            return CellsScreenDataSource.makeForTextField()
        case .scrollLabelGradientView:
            return CellsScreenDataSource.makeForScrollLabelGradient()
        }
    }
}

// MARK: - CaseIterable

extension CellsScreenCell: CaseIterable {}
