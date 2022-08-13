//
//  CellsScreenDataSource+Player.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 12.08.2022.
//

import UIKit
import RandomUIKit

// MARK: - PlayerModel

/// Моделька для ячейки
struct PlayerModel: CellModel {
  let avatar: UIImage?
  let name: String?
  var nameTextColor = RandomColor.primaryGray
  let styleCard: PlayerView.StyleCard
  let styleEmoji: PlayerView.StyleEmoji
  let isBorder: Bool
  var isShadow = false
  
  var titleCell: String
  var reuseIdentifier = CellsScreenCell.playerViewAndCell.reuseIdentifier
}

extension CellsScreenDataSource where Model == PlayerModel {
  static func makeForPlayer() -> CellsScreenDataSource {
    let models = [
      PlayerModel(
        avatar: UIImage(named: "player3"),
        name: "Илларионов Артур",
        styleCard: .defaultStyle,
        styleEmoji: .like,
        isBorder: true,
        titleCell: "PlayerView"
      ),
      PlayerModel(
        avatar: UIImage(named: "player2"),
        name: "Сосин Виталий",
        styleCard: .selected,
        styleEmoji: .customEmoji("🔥"),
        isBorder: false,
        isShadow: true,
        titleCell: "PlayerView"
      ),
      PlayerModel(
        avatar: UIImage(named: "player1"),
        name: "Зимин Максим",
        nameTextColor: RandomColor.primaryWhite,
        styleCard: .customStyle(RandomColor.secondaryRed),
        styleEmoji: .none,
        isBorder: true,
        isShadow: true,
        titleCell: "PlayerView"
      )
    ]
    return CellsScreenDataSource(models: models) { (model, cell) in
      guard let cell = cell as? PlayerTableViewCell else {
        return
      }
      cell.configureCellWith(
        titleCell: model.titleCell,
        avatar: model.avatar,
        name: model.name,
        nameTextColor: model.nameTextColor,
        styleCard: model.styleCard,
        styleEmoji: model.styleEmoji,
        isBorder: model.isBorder,
        isShadow: model.isShadow,
        emojiAction: {
          print("emojiAction")
        },
        cardAction: {
          print("cardAction")
        }
      )
    }
  }
}
