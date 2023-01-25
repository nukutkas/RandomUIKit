//
//  CellsScreenView.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit
import RandomUIKit

/// События которые отправляем из View в Presenter
protocol CellsScreenViewOutput: AnyObject {
  
}

/// События которые отправляем от Presenter ко View
protocol CellsScreenViewInput: AnyObject {
  
  /// Настройка главного экрана
  ///  - Parameter content: Список ячеек
  func configure(with content: [CellsScreenCell])
}

/// Псевдоним протокола UIView & CellsScreenViewInput
typealias CellsScreenViewProtocol = UIView & CellsScreenViewInput

/// View для экрана
final class CellsScreenView: CellsScreenViewProtocol {
  
  // MARK: - Internal properties
  
  weak var output: CellsScreenViewOutput?
  var keyboardService: KeyboardService? {
    didSet {
      keyboardService?.keyboardHeightChangeAction = { [weak self] keyboardHeight in
        self?.tableView.contentInset = UIEdgeInsets(top: .zero,
                                                    left: .zero,
                                                    bottom: keyboardHeight,
                                                    right: .zero)
      }
    }
  }
  
  // MARK: - Private properties
  
  private let tableView = TableView()
  private var dataSource: UITableViewDataSource?
  
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
  
  func configure(with content: [CellsScreenCell]) {
    registerCells(content)
    dataSource = createDataSourcesWith(content)
    tableView.dataSource = dataSource
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
    backgroundColor = RandomColor.darkAndLightTheme.primaryWhite
    tableView.backgroundColor = RandomColor.darkAndLightTheme.primaryWhite
    
    tableView.contentInset = appearance.tableViewInsets
    tableView.delegate = self
    
    tableView.isExclusiveTouch = true
    tableView.delaysContentTouches = false
    tableView.isScrollEnabled = true
    
    tableView.estimatedRowHeight = appearance.estimatedRowHeight
    tableView.rowHeight = UITableView.automaticDimension
    tableView.separatorInset = appearance.separatorInset
  }
  
  private func createDataSourcesWith(_ content: [CellsScreenCell]) -> ComposableTableDataSource {
    var dataSources: [UITableViewDataSource] = []
    
    content.forEach {
      if let dataSource = $0.dataSource {
        dataSources.append(dataSource)
      }
    }
    return ComposableTableDataSource(dataSources)
  }
  
  private func registerCells(_ content: [CellsScreenCell]) {
    content.forEach {
      tableView.register($0.cellClass, forCellReuseIdentifier: $0.reuseIdentifier)
    }
  }
}

// MARK: - UITableViewDelegate

extension CellsScreenView: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    endEditing(true)
  }
}

// MARK: - Appearance

private extension CellsScreenView {
  struct Appearance {
    let tableViewInsets: UIEdgeInsets = .zero
    let estimatedRowHeight: CGFloat = 95
    let separatorInset = UIEdgeInsets(top: .zero,
                                      left: .greatestFiniteMagnitude,
                                      bottom: .zero,
                                      right: .zero)
  }
}
