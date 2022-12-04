//
//  UIView+Animations.swift
//  
//
//  Created by Vitalii Sosin on 04.12.2022.
//

import UIKit

public extension UIView {
  /// Простое увеличение представления: установите масштаб представления на 0 и увеличьте масштаб до
  /// Идентичности на временном интервале «длительность».
  /// - Parameters:
  ///  - duration: animation duration
  ///  - transformScale: transform scale
  func zoomIn(duration: TimeInterval = 0.2,
              transformScale: CGAffineTransform = CGAffineTransform(scaleX: 0.9, y: 0.9)) {
    self.transform = transformScale
    UIView.animate(withDuration: duration,
                   delay: .zero,
                   options: [.curveLinear], animations: { () -> Void in
      self.transform = .identity
    }) { (animationCompleted: Bool) -> Void in }
  }
  
  /// Простое уменьшение масштаба представления: установите для масштаба представления
  /// значение «Идентичность» и уменьшите масштаб до 0 на временном интервале «длительность».
  ///  - Parameters:
  ///   - duration: animation duration
  ///   - transformScale: transform scale
  func zoomOut(duration : TimeInterval = 0.2,
               transformScale: CGAffineTransform = CGAffineTransform(scaleX: 0.9, y: 0.9)) {
    self.transform = .identity
    UIView.animate(withDuration: duration,
                   delay: .zero,
                   options: [.curveLinear],
                   animations: { () -> Void in
      self.transform = transformScale
    }) { (animationCompleted: Bool) -> Void in }
  }
  
  /// Масштабируйте любой вид с указанным увеличением смещения.
  /// - Parameters:
  ///  - duration: animation duration.
  ///  - easingOffset easing offset.
  func zoomInWithEasing(duration: TimeInterval = 0.2, easingOffset: CGFloat = 0.05) {
    let easeScale = 1.0 + easingOffset
    let easingDuration = TimeInterval(easingOffset) * duration / TimeInterval(easeScale)
    let scalingDuration = duration - easingDuration
    UIView.animate(withDuration: scalingDuration,
                   delay: .zero,
                   options: .curveEaseIn,
                   animations: { () -> Void in
      self.transform = CGAffineTransform(scaleX: easeScale, y: easeScale)
    }, completion: { (completed: Bool) -> Void in
      UIView.animate(withDuration: easingDuration,
                     delay: .zero,
                     options: .curveEaseOut,
                     animations: { () -> Void in
        self.transform = .identity
      }, completion: { (completed: Bool) -> Void in
      })
    })
  }
  
  /// Уменьшите масштаб любого вида с указанным увеличением смещения.
  /// - Parameters:
  ///  - duration: animation duration.
  ///  - easingOffset: easing offset.
  func zoomOutWithEasing(duration: TimeInterval = 0.2, easingOffset: CGFloat = 0.05) {
    let easeScale = 1.0 + easingOffset
    let easingDuration = TimeInterval(easingOffset) * duration / TimeInterval(easeScale)
    let scalingDuration = duration - easingDuration
    UIView.animate(withDuration: easingDuration,
                   delay: .zero,
                   options: .curveEaseOut,
                   animations: { () -> Void in
      self.transform = CGAffineTransform(scaleX: easeScale, y: easeScale)
    }, completion: { (completed: Bool) -> Void in
      UIView.animate(withDuration: scalingDuration,
                     delay: .zero,
                     options: .curveEaseOut,
                     animations: { () -> Void in
        self.transform = CGAffineTransform(scaleX: .zero, y: .zero)
      }, completion: { (completed: Bool) -> Void in
      })
    })
  }
}
