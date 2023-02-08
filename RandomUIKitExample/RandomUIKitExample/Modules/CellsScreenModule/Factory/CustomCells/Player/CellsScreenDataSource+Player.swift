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
  let styleCard: PlayerView.StyleCard
  let styleEmoji: PlayerView.StyleEmoji
  var setIsCheckmark: Bool = false
  var setIsLocked: Bool = false
  
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
        titleCell: "PlayerView"
      ),
      PlayerModel(
        avatar: UIImage(named: "player2"),
        name: "Сосин Виталий",
        styleCard: .darkGreen,
        styleEmoji: .customEmoji("🔥"),
        titleCell: "PlayerView"
      ),
      PlayerModel(
        avatar: UIImage(named: "player2"),
        name: "Сосин Виталий",
        styleCard: .darkBlue,
        styleEmoji: .none,
        titleCell: "PlayerView"
      ),
      PlayerModel(
        avatar: UIImage(named: "player2"),
        name: "Сосин Виталий",
        styleCard: .darkOrange,
        styleEmoji: .none,
        setIsCheckmark: true,
        setIsLocked: false,
        titleCell: "PlayerView"
      ),
      PlayerModel(
        avatar: UIImage(named: "player2"),
        name: "Сосин Виталий",
        styleCard: .darkRed,
        styleEmoji: .none,
        setIsCheckmark: false,
        setIsLocked: true,
        titleCell: "PlayerView"
      ),
      PlayerModel(
        avatar: UIImage(named: "player2"),
        name: "Сосин Виталий",
        styleCard: .darkPurple,
        styleEmoji: .none,
        titleCell: "PlayerView"
      ),
      PlayerModel(
        avatar: UIImage(named: "player2"),
        name: "Сосин Виталий",
        styleCard: .darkPink,
        styleEmoji: .none,
        titleCell: "PlayerView"
      ),
      PlayerModel(
        avatar: UIImage(named: "player2"),
        name: "Сосин Виталий",
        styleCard: .darkYellow,
        styleEmoji: .none,
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
        styleCard: model.styleCard,
        styleEmoji: model.styleEmoji,
        setIsCheckmark: model.setIsCheckmark,
        setIsLocked: model.setIsLocked,
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
