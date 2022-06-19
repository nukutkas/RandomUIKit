//
//  UIFont+DynamicProvider.swift
//
//  Created by Vitalii Sosin on 01.05.2022.
//

import UIKit

extension UIFont {
  static func get(font: FontToken) -> UIFont {
    switch font {
    case .primaryBold70:
      return UIFont.systemFont(ofSize: 70, weight: .bold)
    case .primaryBold50:
      return UIFont.systemFont(ofSize: 50, weight: .bold)
    case .primaryBold32:
      return UIFont.systemFont(ofSize: 32, weight: .bold)
    case .primaryBold24:
      return UIFont.systemFont(ofSize: 24, weight: .bold)
    case .primaryBold18:
      return UIFont.systemFont(ofSize: 18, weight: .bold)
    case .primaryBold16:
      return UIFont.systemFont(ofSize: 16, weight: .bold)
    case .primaryBold10:
      return UIFont.systemFont(ofSize: 10, weight: .bold)
    case .primaryMedium32:
      return UIFont.systemFont(ofSize: 32, weight: .medium)
    case .primaryMedium24:
      return UIFont.systemFont(ofSize: 24, weight: .medium)
    case .primaryMedium18:
      return UIFont.systemFont(ofSize: 18, weight: .medium)
    case .primaryMedium16:
      return UIFont.systemFont(ofSize: 16, weight: .medium)
    case .primaryMedium10:
      return UIFont.systemFont(ofSize: 10, weight: .medium)
    case .primaryRegular32:
      return UIFont.systemFont(ofSize: 32, weight: .regular)
    case .primaryRegular24:
      return UIFont.systemFont(ofSize: 24, weight: .regular)
    case .primaryRegular18:
      return UIFont.systemFont(ofSize: 18, weight: .regular)
    case .primaryRegular16:
      return UIFont.systemFont(ofSize: 16, weight: .regular)
    case .primaryRegular10:
      return UIFont.systemFont(ofSize: 10, weight: .regular)
    case .primaryLight48:
      return UIFont.systemFont(ofSize: 48, weight: .light)
    }
  }
}
