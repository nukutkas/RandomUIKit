//
//  ColorsScreenView.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit
import RandomUIKit

/// События которые отправляем из View в Presenter
protocol ColorsScreenViewOutput: AnyObject {
    
}

/// События которые отправляем от Presenter ко View
protocol ColorsScreenViewInput: AnyObject {
    
    /// Настройка главного экрана
    ///  - Parameter colors: Список цветов
    func configure(with colors: [ColorsScreenCell])
}

/// Псевдоним протокола UIView & ColorsScreenViewInput
typealias ColorsScreenViewProtocol = UIView & ColorsScreenViewInput

/// View для экрана
final class ColorsScreenView: ColorsScreenViewProtocol {
    
    // MARK: - Internal properties
    
    weak var output: ColorsScreenViewOutput?
    
    // MARK: - Private properties
    
    private let tableView = UITableView()
    private var colors: [ColorsScreenCell] = []
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureLayout()
        applyDefaultBehavior()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal func
    
    func configure(with colors: [ColorsScreenCell]) {
        self.colors = colors
        tableView.reloadData()
    }
    
    // MARK: - Private func
    
    private func configureLayout() {
        let appearance = Appearance()
        
        [tableView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor, constant: appearance.tableViewInsets.top),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: appearance.tableViewInsets.left),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -appearance.tableViewInsets.right),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -appearance.tableViewInsets.bottom)
        ])
    }
    
    private func applyDefaultBehavior() {
        let appearance = Appearance()
        backgroundColor = RandomColor.secondaryWhite
        
        tableView.contentInset = appearance.tableViewInsets
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = appearance.estimatedRowHeight
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorInset = appearance.separatorInset
        tableView.register(ColorsScreenViewCell.self,
                           forCellReuseIdentifier: ColorsScreenViewCell.cellIdentifier)
    }
}

// MARK: - UITableViewDelegate

extension ColorsScreenView: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource

extension ColorsScreenView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ColorsScreenViewCell.cellIdentifier) else {
            return UITableViewCell()
        }
        
        if let colorsCell = cell as? ColorsScreenViewCell {
            colorsCell.configure(
                titleText: colors[indexPath.row].rawValue,
                color: colors[indexPath.row].color
            )
        }
        return cell
    }
}

// MARK: - Appearance

private extension ColorsScreenView {
    struct Appearance {
        let tableViewInsets: UIEdgeInsets = .zero
        let estimatedRowHeight: CGFloat = 95
        let separatorInset = UIEdgeInsets(top: .zero,
                                          left: .greatestFiniteMagnitude,
                                          bottom: .zero,
                                          right: .zero)
    }
}
