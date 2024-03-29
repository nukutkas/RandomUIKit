//
//  GradientView.swift
//  
//
//  Created by Vitalii Sosin on 09.09.2022.
//

import UIKit

/// View для экрана
public final class GradientView: UIView {
  
  // MARK: - Public properties
  
  public override class var layerClass: AnyClass {
    return CAGradientLayer.self
  }
  
  // MARK: - Initialization
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    applyDefaultBehavior()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Public func
  
  public func applyGradient(colors: [UIColor], alpha: CGFloat = 1) {
    guard let gradientLayer = layer as? CAGradientLayer else { return }
    gradientLayer.colors = colors.map {
      if $0 == UIColor.clear {
        return $0.withAlphaComponent(.zero).cgColor
      } else {
        return $0.withAlphaComponent(alpha).cgColor
      }
    }
  }
  
  private func applyDefaultBehavior() {
    backgroundColor = .clear
  }
}
