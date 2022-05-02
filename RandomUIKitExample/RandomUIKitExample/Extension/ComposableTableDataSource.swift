//
//  ComposableTableDataSource.swift
//
//  Created by Vitalii Sosin on 01.05.2022.
//

import UIKit

/// Композиция DataSource
final class ComposableTableDataSource: NSObject {

    private let dataSources: [UITableViewDataSource]

    init(_ dataSources: [UITableViewDataSource]) {
        self.dataSources = dataSources
    }
}

// MARK: - UITableViewDataSource

extension ComposableTableDataSource: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        dataSources.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSources[section].tableView(tableView, numberOfRowsInSection: .zero)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataSource = dataSources[indexPath.section]
        let indexPath = IndexPath(row: indexPath.row, section: .zero)
        return dataSource.tableView(tableView, cellForRowAt: indexPath)
    }
}
