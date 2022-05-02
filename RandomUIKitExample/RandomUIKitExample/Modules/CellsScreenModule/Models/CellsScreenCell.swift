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
    
    var reuseIdentifier: String {
        return cellClass.description()
    }
    
    var cellClass: UITableViewCell.Type {
        switch self {
        case .mainCardTableViewCell:
            return MainCardTableViewCell.self
        case .labelGradientView:
            return LabelGradientTableViewCell.self
        }
    }
    
    var dataSource: UITableViewDataSource? {
        switch self {
        case .mainCardTableViewCell:
            return CellsScreenDataSource.makeForMainCard()
        case .labelGradientView:
            return CellsScreenDataSource.makeForLabelGradient()
        }
    }
}

// MARK: - CaseIterable

extension CellsScreenCell: CaseIterable {}
