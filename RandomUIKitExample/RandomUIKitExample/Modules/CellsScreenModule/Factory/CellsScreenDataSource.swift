//
//  CellsScreenDataSource.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit

// MARK: - CellModel

protocol CellModel {
    
    /// Пишем есть ли `View` в библиотеке, например `MainCardView - ✅\n`
    var titleView: String { get set }
    
    /// Пишем есть ли `TableViewCell` в библиотеке, например `MainCardTableViewCell - ✅\n`
    var titleTableViewCell: String { get set }
    
    /// Пишем есть ли `CollectionViewCell` в библиотеке, например `MainCardCollectionViewCell - ✅`
    var titleCollectionViewCell: String { get set }
    
    /// Идентификация
    var reuseIdentifier: String { get set }
}

// MARK: - TableViewDataSource

final class CellsScreenDataSource<Model: CellModel>: NSObject, UITableViewDataSource {
    typealias CellConfigurator = (Model, UITableViewCell) -> Void
    
    var models: [Model]
    
    private let cellConfigurator: CellConfigurator
    
    init(models: [Model], cellConfigurator: @escaping CellConfigurator) {
        self.models = models
        self.cellConfigurator = cellConfigurator
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: model.reuseIdentifier, for: indexPath)
        
        cellConfigurator(model, cell)
        
        return cell
    }
}
