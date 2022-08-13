//
//  LabelAndSwitchWithSegmentedCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 10.07.2022.
//

import UIKit

// MARK: - LabelAndSwitchWithSegmentedCell

public final class LabelAndSwitchWithSegmentedCell: UITableViewCell {
  
  // MARK: - Public properties
  
  /// Action на изменение переключателя
  public var switchAction: ((Bool) -> Void)?
  
  /// Акшен (Значение было изменено)
  public var segmentValueChanged: (() -> Void)?
  
  /// Индекс выбранного значения
  public var selectedSegmentIndex: Int {
    get {
      segmentedControlView.selectedSegmentIndex
    } set {
      segmentedControlView.selectedSegmentIndex = newValue
    }
  }
  
  /// Identifier для ячейки
  public static let reuseIdentifier = LabelAndSwitchWithSegmentedCell.description()
  
  // MARK: - Private property
  
  private let segmentedControlView = UISegmentedControl()
  private let titleLabel = UILabel()
  private let resultSwitch = UISwitch()
  private let horizontalStack = UIStackView()
  
  // MARK: - Initilisation
  
  public override init(style: CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    configureLayout()
    applyDefaultBehavior()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError()
  }
  
  // MARK: - Public func
  
  /// Добавить сегмент по индексу
  ///  - Parameters:
  ///   - withTitle: Название сегмента
  ///   - at: Индекс сегмента
  ///   - animated: Добавление с анимацией
  public func insertSegment(withTitle title: String?, at segment: Int, animated: Bool) {
    segmentedControlView.insertSegment(withTitle: title, at: segment, animated: animated)
  }
  
  /// Настраиваем ячейку
  /// - Parameters:
  ///  - titleText: Заголовок у ячейки
  ///  - isResultSwitch: Значение у переключателя
  public func configureCellWith(titleText: String?, isResultSwitch: Bool) {
    titleLabel.text = titleText
    resultSwitch.isOn = isResultSwitch
  }
  
  /// Удалить все элементы в сегменте
  public func removeAllSegments() {
    segmentedControlView.removeAllSegments()
  }
  
  // MARK: - Private func
  
  private func configureLayout() {
    let appearance = Appearance()
    
    [horizontalStack, segmentedControlView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    
    [titleLabel, resultSwitch].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      horizontalStack.addArrangedSubview($0)
    }
    
    NSLayoutConstraint.activate([
      horizontalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                               constant: appearance.insets.left),
      horizontalStack.topAnchor.constraint(equalTo: contentView.topAnchor,
                                           constant: appearance.insets.top),
      horizontalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                constant: -appearance.insets.right),
      
      segmentedControlView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                    constant: appearance.insets.left),
      segmentedControlView.topAnchor.constraint(equalTo: horizontalStack.bottomAnchor,
                                                constant: appearance.insets.top),
      segmentedControlView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                     constant: -appearance.insets.right),
      segmentedControlView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                   constant: -appearance.insets.bottom)
    ])
  }
  
  private func applyDefaultBehavior() {
    backgroundColor = RandomColor.primaryWhite
    selectionStyle = .none
    
    titleLabel.font = RandomFont.primaryRegular18
    titleLabel.textColor = RandomColor.primaryGray
    
    resultSwitch.addTarget(self, action: #selector(resultSwitchAction(_:)), for: .valueChanged)
    segmentedControlView.addTarget(self, action: #selector(segmentedControlViewAction), for: .valueChanged)
  }
  
  // MARK: - Private func
  
  @objc
  private func resultSwitchAction(_ sender: UISwitch) {
    switchAction?(sender.isOn)
  }
  
  @objc
  private func segmentedControlViewAction() {
    segmentValueChanged?()
  }
}

// MARK: - Appearance

private extension LabelAndSwitchWithSegmentedCell {
  struct Appearance {
    let insets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
  }
}
