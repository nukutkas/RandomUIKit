//
//  PurchasesCardsCellModelProtocol.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 15.01.2023.
//

import Foundation

public protocol PurchasesCardsCellModelProtocol {
  
  /// Тайтл в заголовке
  var header: String? { get }
  
  /// Тайтл
  var title: String? { get }
  
  /// Описание
  var description: String? { get }
  
  /// Сумма
  var amount: String? { get }
  
  /// экшен
  var action: (() -> Void)? { get set }
}
