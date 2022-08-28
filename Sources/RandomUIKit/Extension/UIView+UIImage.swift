//
//  UIView+UIImage.swift
//  
//
//  Created by Vitalii Sosin on 28.08.2022.
//

import UIKit

public extension UIView {
  
  func asImage() -> UIImage? {
    if #available(iOS 10.0, *) {
      let renderer = UIGraphicsImageRenderer(bounds: bounds)
      return renderer.image { rendererContext in
        layer.render(in: rendererContext.cgContext)
      }
    } else {
      guard let context = UIGraphicsGetCurrentContext() else {
        return nil
      }
      UIGraphicsBeginImageContext(self.frame.size)
      self.layer.render(in: context)
      let image = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()
      return UIImage(cgImage: image!.cgImage!)
    }
  }
}
