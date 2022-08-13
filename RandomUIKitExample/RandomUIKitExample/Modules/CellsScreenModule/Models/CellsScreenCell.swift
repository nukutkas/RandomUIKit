//
//  CellsScreenCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit
import RandomUIKit

// MARK: - CellsScreenCell

enum CellsScreenCell: String {
  
  // MARK: - Cases
  
  /// Основная карточка на главном экране
  case mainCardTableViewCell
  
  /// Рекламный лайбл
  case labelGradientView
  
  /// Основная кнопка
  case button
  
  /// Текстовое поле
  case textField
  
  /// Список элементов в формате `String`
  case scrollLabelGradientView
  
  /// Ячейка с текстом и переключателем
  case labelAndSwitchCell
  
  /// Ячейка с двумя заголовками
  case doubleTitleCell
  
  /// Ячейка с текстом и иконкой
  case labelAndImageCell
  
  /// Ячейка с маленькой кнопкой
  case smallButtonCell
  
  /// Ячейка с настраиваемым текстом
  case customTextCell
  
  /// Ячейка с настраиваемой высотой
  case customPaddingCell
  
  /// Ячейка с текстом, переключателем и
  /// список элементов в формате `Segmented`
  case labelAndSwitchWithSegmentedCell
  
  /// Вью и ячейка для коллекции с игроком
  case playerViewAndCell
  
  /// Ячейка с информацией об игроке
  case playerInfoCell
  
  var reuseIdentifier: String {
    return cellClass.description()
  }
  
  var cellClass: UITableViewCell.Type {
    switch self {
    case .mainCardTableViewCell:
      return MainCardTableViewCell.self
    case .labelGradientView:
      return LabelGradientTableViewCell.self
    case .button:
      return ButtonTableViewCell.self
    case .textField:
      return TextFieldTableViewCell.self
    case .scrollLabelGradientView:
      return ScrollLabelGradientTableViewCell.self
    case .labelAndSwitchCell:
      return LabelAndSwitchCell.self
    case .doubleTitleCell:
      return DoubleTitleCell.self
    case .labelAndImageCell:
      return LabelAndImageCell.self
    case .smallButtonCell:
      return SmallButtonCell.self
    case .customTextCell:
      return CustomTextCell.self
    case .customPaddingCell:
      return CustomPaddingCell.self
    case .labelAndSwitchWithSegmentedCell:
      return LabelAndSwitchWithSegmentedCell.self
    case .playerViewAndCell:
      return PlayerTableViewCell.self
    case .playerInfoCell:
      return PlayerInfoTableViewCell.self
    }
  }
  
  var dataSource: UITableViewDataSource? {
    switch self {
    case .mainCardTableViewCell:
      return CellsScreenDataSource.makeForMainCard()
    case .labelGradientView:
      return CellsScreenDataSource.makeForLabelGradient()
    case .button:
      return CellsScreenDataSource.makeForButton()
    case .textField:
      return CellsScreenDataSource.makeForTextField()
    case .scrollLabelGradientView:
      return CellsScreenDataSource.makeForScrollLabelGradient()
    case .labelAndSwitchCell:
      return CellsScreenDataSource.makeForLabelAndSwitch()
    case .doubleTitleCell:
      return CellsScreenDataSource.makeForDoubleTitle()
    case .labelAndImageCell:
      return CellsScreenDataSource.makeForLabelAndImage()
    case .smallButtonCell:
      return CellsScreenDataSource.makeForSmallButton()
    case .customTextCell:
      return CellsScreenDataSource.makeForCustomText()
    case .customPaddingCell:
      return CellsScreenDataSource.makeForCustomPadding()
    case .labelAndSwitchWithSegmentedCell:
      return CellsScreenDataSource.makeForLabelAndSwitchWithSegmented()
    case .playerViewAndCell:
      return CellsScreenDataSource.makeForPlayer()
    case .playerInfoCell:
      return CellsScreenDataSource.makeForPlayerInfo()
    }
  }
}

// MARK: - CaseIterable

extension CellsScreenCell: CaseIterable {}
