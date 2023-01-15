//
//  OnboardingContainerView.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 15.01.2023.
//

import UIKit
import RandomUIKit

/// OnboardingContainerView
final class OnboardingContainerView: UIView {
  
  // MARK: - Private properties
  
  private let containerView = UIView()
  
  private let titleLabel = UILabel()
  private let descriptionLabel = UILabel()
//  private var lottieAnimationView = LottieAnimationView()
  private var lottieAnimationView = UIView()
  
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
  
  func configureWith(lottieAnimationJSONName: String, title: String?, description: String?) {
//    lottieAnimationView = .init(name: lottieAnimationJSONName,
//                                bundle: .main)
//    lottieAnimationView.contentMode = .scaleAspectFit
//    lottieAnimationView.loopMode = .loop
//    lottieAnimationView.animationSpeed = Appearance().animationSpeed
//    lottieAnimationView.play()

    titleLabel.text = title
    descriptionLabel.text = description
    self.layoutIfNeeded()
  }
}

// MARK: - Private

private extension OnboardingContainerView {
  func configureLayout() {
    let appearance = Appearance()
    
    [lottieAnimationView, titleLabel, descriptionLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      containerView.addSubview($0)
    }
    
    [containerView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
      containerView.topAnchor.constraint(equalTo: topAnchor),
      containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
      containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
      
      lottieAnimationView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
      lottieAnimationView.topAnchor.constraint(equalTo: containerView.topAnchor),
      lottieAnimationView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
      
      titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,
                                          constant: appearance.defaultInset),
      titleLabel.topAnchor.constraint(equalTo: lottieAnimationView.bottomAnchor,
                                      constant: appearance.minInset),
      titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,
                                           constant: -appearance.defaultInset),
      
      descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,
                                                constant: appearance.defaultInset),
      descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                            constant: appearance.minInset),
      descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,
                                                 constant: -appearance.defaultInset),
      descriptionLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
    ])
  }
  
  func applyDefaultBehavior() {
    backgroundColor = RandomColor.primaryWhite
    
    lottieAnimationView.contentMode = .scaleAspectFit
    lottieAnimationView.setContentHuggingPriority(.defaultHigh, for: .vertical)
    lottieAnimationView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    
    titleLabel.textAlignment = .center
    titleLabel.numberOfLines = .zero
    titleLabel.font = RandomFont.primaryMedium32
    titleLabel.textColor = RandomColor.primaryGray
    
    descriptionLabel.textAlignment = .center
    descriptionLabel.numberOfLines = .zero
    descriptionLabel.font = RandomFont.primaryRegular24
    descriptionLabel.textColor = RandomColor.primaryGray
  }
}

// MARK: - Appearance

private extension OnboardingContainerView {
  struct Appearance {
    let minInset: CGFloat = 4
    let defaultInset: CGFloat = 16
    let animationSpeed: CGFloat = 0.5
  }
}
