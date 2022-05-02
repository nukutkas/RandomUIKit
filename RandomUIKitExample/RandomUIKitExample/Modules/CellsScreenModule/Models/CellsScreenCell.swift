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
    
    case mainCardTableViewCell
    
    var reuseIdentifier: String {
        return cellClass.description()
    }
    
    var cellClass: UITableViewCell.Type {
        switch self {
        case .mainCardTableViewCell:
            return MainCardTableViewCell.self
        }
    }
    
    var dataSource: UITableViewDataSource? {
        switch self {
        case .mainCardTableViewCell:
            return CellsScreenDataSource.makeForMainCard()
        }
    }
}

// MARK: - CaseIterable

extension CellsScreenCell: CaseIterable {}
