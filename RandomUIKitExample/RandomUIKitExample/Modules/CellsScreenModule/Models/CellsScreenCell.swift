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
  
  /// Ячейки с оплатой
  case purchasesCardsCell
  
  /// Ячейка с текстом и ссылками
  case linkTextViewCell
  
  /// Заголовок и описание
  case headerTitleAndSubtitleViewCell
  
  /// Ячейка с онбордингом
  case onboardingViewCell
  
  /// Рекламный лайбл
  case labelGradientView
  
  /// Основная кнопка
  case button
  
  /// Текстовое поле
  case textField
  
  /// Список элементов в формате `String`
  case scrollLabelGradientView
  
  /// Ячейка с маленькой кнопкой
  case smallButtonCell
  
  /// Ячейка с настраиваемым текстом
  case customTextCell
  
  /// Ячейка с настраиваемой высотой
  case customPaddingCell
  
  /// Вью и ячейка для коллекции с игроком
  case playerViewAndCell
  
  /// Ячейка с информацией об игроке
  case playerInfoCell
  
  /// Ячейка текствого поля с кнопкой
  case textFieldWithButton
  
  /// Ячейка для добавления нового игрока в команду
  case textFielAddPlayerCell
  
  /// Ячейка рфзделителя
  case divider
  
  /// Ячейка с текстом и переключателем
  case labelAndSwitchCell
  
  /// Ячейка с двумя заголовками
  case doubleTitleCell
  
  /// Ячейка с текстом и иконкой
  case labelAndChevronCell
  
  /// Ячейка с изображением, текстом и шевроном
  case imageAndLabelWithChevronCell
  
  /// Ячейка с изображением, текстом и переключателем
  case imageAndLabelWithSwitchCell
  
  /// Ячейка с изображением и двумя текстами
  case imageAndDoubleTitleCell
  
  /// Ячейка с squircle, текстом и переключателем
  case squircleImageAndLabelWithSwitchCell
  
  /// Ячейка с squircle, текстом и шевроном
  case squircleImageAndLabelWithChevronCell
  
  /// Ячейка с squircle и двумя текстами
  case squircleImageAndDoubleTitleCell
  
  /// Ячейка со SquircleView
  case squircleViewCell
  
  /// Ячейка с большим изображением, текстом и галочкой справа
  case largeImageAndLabelWithCheakmarkCell
  
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
    case .labelAndChevronCell:
      return LabelAndChevronCell.self
    case .smallButtonCell:
      return SmallButtonCell.self
    case .customTextCell:
      return CustomTextCell.self
    case .customPaddingCell:
      return CustomPaddingCell.self
    case .playerViewAndCell:
      return PlayerTableViewCell.self
    case .playerInfoCell:
      return PlayerInfoTableViewCell.self
    case .textFieldWithButton:
      return TextFieldWithButtonCell.self
    case .divider:
      return DividerTableViewCell.self
    case .textFielAddPlayerCell:
      return TextFielAddPlayerCell.self
    case .purchasesCardsCell:
      return PurchasesCardsCell.self
    case .linkTextViewCell:
      return LinkTextViewCell.self
    case .onboardingViewCell:
      return OnboardingViewCell.self
    case .headerTitleAndSubtitleViewCell:
      return HeaderTitleAndSubtitleViewCell.self
    case .squircleViewCell:
      return SquircleViewCell.self
    case .imageAndLabelWithChevronCell:
      return ImageAndLabelWithChevronCell.self
    case .imageAndLabelWithSwitchCell:
      return ImageAndLabelWithSwitchCell.self
    case .imageAndDoubleTitleCell:
      return ImageAndDoubleTitleCell.self
    case .squircleImageAndLabelWithSwitchCell:
      return SquircleImageAndLabelWithSwitchCell.self
    case .squircleImageAndLabelWithChevronCell:
      return SquircleImageAndLabelWithChevronCell.self
    case .squircleImageAndDoubleTitleCell:
      return SquircleImageAndDoubleTitleCell.self
    case .largeImageAndLabelWithCheakmarkCell:
      return LargeImageAndLabelWithCheakmarkCell.self
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
    case .labelAndChevronCell:
      return CellsScreenDataSource.makeForLabelAndImage()
    case .smallButtonCell:
      return CellsScreenDataSource.makeForSmallButton()
    case .customTextCell:
      return CellsScreenDataSource.makeForCustomText()
    case .customPaddingCell:
      return CellsScreenDataSource.makeForCustomPadding()
    case .playerViewAndCell:
      return CellsScreenDataSource.makeForPlayer()
    case .playerInfoCell:
      return CellsScreenDataSource.makeForPlayerInfo()
    case .textFieldWithButton:
      return CellsScreenDataSource.makeForTextFieldWithButton()
    case .divider:
      return CellsScreenDataSource.makeForDivider()
    case .textFielAddPlayerCell:
      return CellsScreenDataSource.makeForTextFielAddPlayer()
    case .purchasesCardsCell:
      return CellsScreenDataSource.makeForPurchasesCardsCell()
    case .linkTextViewCell:
      return CellsScreenDataSource.makeForLinkTextViewCell()
    case .onboardingViewCell:
      return CellsScreenDataSource.makeForOnboardingViewCellModel()
    case .headerTitleAndSubtitleViewCell:
      return CellsScreenDataSource.makeForHeaderTitleAndSubtitleViewCell()
    case .squircleViewCell:
      return CellsScreenDataSource.makeForSquircleViewCell()
    case .imageAndLabelWithChevronCell:
      return CellsScreenDataSource.makeForImageAndLabelWithChevronCell()
    case .imageAndLabelWithSwitchCell:
      return CellsScreenDataSource.makeForImageAndLabelWithSwitchCell()
    case .imageAndDoubleTitleCell:
      return CellsScreenDataSource.makeForImageAndDoubleTitleCell()
    case .squircleImageAndLabelWithSwitchCell:
      return CellsScreenDataSource.makeForSquircleImageAndLabelWithSwitchCell()
    case .squircleImageAndLabelWithChevronCell:
      return CellsScreenDataSource.makeForSquircleImageAndLabelWithChevronCell()
    case .squircleImageAndDoubleTitleCell:
      return CellsScreenDataSource.makeForSquircleImageAndDoubleTitleCell()
    case .largeImageAndLabelWithCheakmarkCell:
      return CellsScreenDataSource.makeForLargeImageAndLabelWithCheakmarkCell()
    }
  }
}

// MARK: - CaseIterable

extension CellsScreenCell: CaseIterable {}
