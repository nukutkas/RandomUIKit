//
//  FontsScreenView.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit
import RandomUIKit

/// События которые отправляем из View в Presenter
protocol FontsScreenViewOutput: AnyObject {}

/// События которые отправляем от Presenter ко View
protocol FontsScreenViewInput: AnyObject {
  
  /// Настройка главного экрана
  ///  - Parameter fonts: Список шрифтов
  func configure(with fonts: [FontToken])
}

/// Псевдоним протокола UIView & FontsScreenViewInput
typealias FontsScreenViewProtocol = UIView & FontsScreenViewInput

/// View для экрана
final class FontsScreenView: FontsScreenViewProtocol {
  
  // MARK: - Internal properties
  
  weak var output: FontsScreenViewOutput?
  
  // MARK: - Private properties
  
  private let tableView = UITableView()
  private var fonts: [FontToken] = []
  
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
  
  func configure(with fonts: [FontToken]) {
    self.fonts = fonts
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
      tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -appearance.tableViewInsets.bottom),
    ])
  }
  
  private func applyDefaultBehavior() {
    let appearance = Appearance()
    tableView.backgroundColor = RandomColor.darkAndLightTheme.primaryWhite
    backgroundColor = RandomColor.darkAndLightTheme.primaryWhite
    
    tableView.contentInset = appearance.tableViewInsets
    tableView.delegate = self
    tableView.dataSource = self
    
    tableView.estimatedRowHeight = appearance.estimatedRowHeight
    tableView.rowHeight = UITableView.automaticDimension
    tableView.separatorInset = appearance.separatorInset
    tableView.register(FontsScreenViewCell.self,
                       forCellReuseIdentifier: FontsScreenViewCell.cellIdentifier)
  }
}

// MARK: - UITableViewDelegate

extension FontsScreenView: UITableViewDelegate {
  
}

// MARK: - UITableViewDataSource

extension FontsScreenView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    fonts.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: FontsScreenViewCell.cellIdentifier) else {
      return UITableViewCell()
    }
    
    if let fontsCell = cell as? FontsScreenViewCell {
      fontsCell.configure(fontToken: fonts[indexPath.row])
    }
    return cell
  }
}

// MARK: - Appearance

private extension FontsScreenView {
  struct Appearance {
    let tableViewInsets: UIEdgeInsets = .zero
    let estimatedRowHeight: CGFloat = 95
    let separatorInset = UIEdgeInsets(top: .zero,
                                      left: .greatestFiniteMagnitude,
                                      bottom: .zero,
                                      right: .zero)
  }
}
