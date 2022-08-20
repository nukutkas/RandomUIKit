//
//  CellsScreenDataSource+PlayerInfo.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 13.08.2022.
//

import UIKit
import RandomUIKit

// MARK: - ButtonModel

/// Моделька для ячейки
struct PlayerInfoModel: CellModel {
  let avatar: UIImage?
  let namePlayer: String?
  var namePlayerColor: UIColor = RandomColor.primaryGray
  var namePlayerFont: UIFont = RandomFont.primaryMedium18
  let nameTeam: String?
  var nameTeamColor: UIColor = RandomColor.primaryBlue
  var nameTeamFont: UIFont = RandomFont.primaryRegular16
  let emoji: Character?
  
  private var menuItems: [UIAction] {
    return [
      UIAction(title: "Standard item", image: UIImage(systemName: "sun.max"), handler: { (_) in
      }),
      UIAction(title: "Disabled item", image: UIImage(systemName: "moon"), attributes: .disabled, handler: { (_) in
      }),
      UIAction(title: "Delete..", image: UIImage(systemName: "trash"), attributes: .destructive, handler: { (_) in
      })
    ]
  }
  
  var menu: UIMenu {
    return UIMenu(title: "My menu", image: nil, identifier: nil, options: [], children: menuItems)
  }
  
  var titleCell: String
  var reuseIdentifier = CellsScreenCell.playerInfoCell.reuseIdentifier
}

extension CellsScreenDataSource where Model == PlayerInfoModel {
  static func makeForPlayerInfo() -> CellsScreenDataSource {
    let models = [
      PlayerInfoModel(
        avatar: UIImage(named: "player1"),
        namePlayer: "Сосин Виталий",
        nameTeam: "Команда - 1",
        emoji: "⚪️",
        titleCell: "-"
      ),
      PlayerInfoModel(
        avatar: UIImage(named: "player2"),
        namePlayer: "Зимин Макисм",
        nameTeam: "Команда - 2",
        emoji: "⚽️",
        titleCell: "-"
      ),
      PlayerInfoModel(
        avatar: UIImage(named: "player3"),
        namePlayer: "PlayerInfoTableViewCell",
        nameTeam: nil,
        emoji: nil,
        titleCell: "-"
      )
    ]
    return CellsScreenDataSource(models: models) { (model, cell) in
      guard let cell = cell as? PlayerInfoTableViewCell else {
        return
      }
      cell.configureCellWith(
        avatar: model.avatar,
        namePlayer: model.namePlayer,
        nameTeam: model.nameTeam,
        emoji: model.emoji,
        emojiMenu: model.menu,
        emojiMenuPrimaryAction: true,
        cellMenu: model.menu,
        cellMenuPrimaryAction: true,
        emojiAction: {
          print("emojiAction")
        },
        contentAction: {
          print("contentAction")
        }
      )
    }
  }
}
