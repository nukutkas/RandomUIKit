//
//  ScrollLabelSegmentedControlCell.swift
//
//
//  Created by Vitalii Sosin on 10.07.2022.
//

import UIKit

// MARK: - ScrollLabelSegmentedControlCell

public final class ScrollLabelSegmentedControlCell: UITableViewCell {
  
  // MARK: - Public properties
  
  /// Акшен (Значение было изменено)
  public var valueChanged: (() -> Void)? {
    didSet {
      scrollLabelSegmentedControlView.valueChanged = valueChanged
    }
  }
  
  /// Индекс выбранного значения
  public var selectedSegmentIndex: Int {
    get {
      scrollLabelSegmentedControlView.selectedSegmentIndex
    } set {
      scrollLabelSegmentedControlView.selectedSegmentIndex = newValue
    }
  }
  
  /// Identifier для ячейки
  public static let reuseIdentifier = ScrollLabelSegmentedControlCell.description()
  
  // MARK: - Private property
  
  private let scrollLabelSegmentedControlView = ScrollLabelSegmentedControlView()
  
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
    scrollLabelSegmentedControlView.insertSegment(withTitle: title, at: segment, animated: animated)
  }
  
  /// Удалить все элементы в сегменте
  public func removeAllSegments() {
    scrollLabelSegmentedControlView.removeAllSegments()
  }
  
  // MARK: - Private func
  
  private func configureLayout() {
    let appearance = Appearance()
    
    [scrollLabelSegmentedControlView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    NSLayoutConstraint.activate([
      scrollLabelSegmentedControlView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      scrollLabelSegmentedControlView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                                           constant: appearance.insets.top),
      scrollLabelSegmentedControlView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      scrollLabelSegmentedControlView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                              constant: -appearance.insets.bottom)
    ])
  }
  
  private func applyDefaultBehavior() {
    backgroundColor = RandomColor.secondaryWhite
    selectionStyle = .none
  }
}

// MARK: - Appearance

private extension ScrollLabelSegmentedControlCell {
  struct Appearance {
    let insets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
  }
}
