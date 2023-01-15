//
//  OnboardingView.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 15.01.2023.
//

import UIKit
import RandomUIKit

/// OnboardingView
public final class OnboardingView: UIView {
  
  // MARK: - Private properties
  
  private let pageIndicator = UIPageControl()
  private let scrollView = UIScrollView()
  private let stackView = UIStackView()
  
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
  
  func setPage(_ page: Int) {
    pageIndicator.currentPage = page
    pageIndicatorAction()
  }
  
  func setOnboardingWith(_ models: [OnboardingViewModel]) {
    let screensView: [OnboardingContainerView] = models.map { model in
      let screen = OnboardingContainerView()
      screen.configureWith(lottieAnimationJSONName: model.lottieAnimationJSONName,
                           title: model.title,
                           description: model.description)
      return screen
    }
    
    pageIndicator.numberOfPages = screensView.count
    stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    screensView.forEach { screen in
      screen.translatesAutoresizingMaskIntoConstraints = false
      stackView.addArrangedSubview(screen)
      NSLayoutConstraint.activate([
        screen.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        screen.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
      ])
    }
  }
}

// MARK: - UIScrollViewDelegate

extension OnboardingView: UIScrollViewDelegate {
  public func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                 withVelocity velocity: CGPoint,
                                 targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    pageIndicator.currentPage = Int(targetContentOffset.pointee.x) / Int(frame.size.width)
//    output?.didChangePage(to: pageIndicator.currentPage)
  }
}

// MARK: - Private

private extension OnboardingView {
  func configureLayout() {
    [stackView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      scrollView.addSubview($0)
    }
    
    [pageIndicator, scrollView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: topAnchor),
      scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
      scrollView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.4),
      
      stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
      
      pageIndicator.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
      pageIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
      pageIndicator.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
    ])
  }
  
  func applyDefaultBehavior() {
    backgroundColor = RandomColor.primaryWhite
    
    pageIndicator.hidesForSinglePage = true
    pageIndicator.currentPageIndicatorTintColor = RandomColor.primaryGray
    pageIndicator.pageIndicatorTintColor = RandomColor.tertiaryGray
    pageIndicator.addTarget(self,
                            action: #selector(pageIndicatorAction),
                            for: .valueChanged)
    
    scrollView.isPagingEnabled = true
    scrollView.showsHorizontalScrollIndicator = false
    scrollView.showsVerticalScrollIndicator = false
    scrollView.delegate = self
    
    stackView.axis = .horizontal
    stackView.alignment = .top
  }
  
  @objc
  func pageIndicatorAction() {
    scrollView.setContentOffset(CGPoint(x: CGFloat(pageIndicator.currentPage) * scrollView.bounds.width,
                                        y: .zero),
                                animated: true)
//    output?.didChangePage(to: pageIndicator.currentPage)
  }
}

// MARK: - Appearance

private extension OnboardingView {
  struct Appearance {
    let defaultInset: CGFloat = 16
  }
}
