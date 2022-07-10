//
//  ScrollLabelSegmentedControlView.swift
//
//
//  Created by Vitalii Sosin on 10.07.2022.
//

import UIKit

/// Переопределяем родительский UISegmentedControl и включаем СВАЙПЫ
final class SwipeSegmentedControlView: UISegmentedControl {
  override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
    return true
  }
}

/// View для экрана
public final class ScrollLabelSegmentedControlView: UIView {
  
  // MARK: - Public properties
  
  /// Акшен (Значение было изменено)
  public var valueChanged: (() -> Void)?
  
  /// Индекс выбранного значения
  public var selectedSegmentIndex: Int {
    get {
      segmentedControlView.selectedSegmentIndex
    } set {
      segmentedControlView.selectedSegmentIndex = newValue
    }
  }
  
  // MARK: - Private properties
  
  private let scrollView = UIScrollView()
  private let segmentedControlView = SwipeSegmentedControlView()
  
  // MARK: - Initialization
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configureLayout()
    applyDefaultBehavior()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
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
  
  // MARK: - Private func
  
  private func configureLayout() {
    [scrollView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      addSubview($0)
    }
    
    [segmentedControlView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      scrollView.addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      scrollView.heightAnchor.constraint(equalTo: segmentedControlView.heightAnchor),
      
      scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
      scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
      
      segmentedControlView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      segmentedControlView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      segmentedControlView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      segmentedControlView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
    ])
    
  }
  
  private func applyDefaultBehavior() {
    let appearance = Appearance()
    backgroundColor = RandomColor.secondaryWhite
    
    scrollView.keyboardDismissMode = .interactive
    scrollView.showsHorizontalScrollIndicator = false
    scrollView.contentInset = appearance.insets
    
    segmentedControlView.addTarget(self,
                                   action: #selector(segmentedControlAction),
                                   for: .valueChanged)
  }
  
  @objc
  private func segmentedControlAction() {
    valueChanged?()
  }
}

// MARK: - Appearance

private extension ScrollLabelSegmentedControlView {
  struct Appearance {
    let insets = UIEdgeInsets(top: .zero, left: 16, bottom: .zero, right: 16)
  }
}
