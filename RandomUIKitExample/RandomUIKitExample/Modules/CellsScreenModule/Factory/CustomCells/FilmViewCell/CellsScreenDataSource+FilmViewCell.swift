//
//  CellsScreenDataSource+FilmViewCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 29.01.2023.
//

import UIKit
import RandomUIKit

// MARK: - FilmViewCell

/// Моделька для ячейки
struct FilmViewCellModel: CellModel {
  let backgroundImage: UIImage?
  let title: String?
  let description: String?
  let buttonTitle: String?
  var buttonAction: (() -> Void)?
  
  var titleCell: String = "FilmViewCell"
  var reuseIdentifier = CellsScreenCell.filmViewCell.reuseIdentifier
}

extension CellsScreenDataSource where Model == FilmViewCellModel {
  static func makeForFilmViewCell() -> CellsScreenDataSource {
    let models = [
      FilmViewCellModel(backgroundImage: UIImage(named: "mock_films"),
                        title: "Severance Severance Severance Severance",
                        description: "Thriller • Apr 8, 2022 • 40 min Thriller • Apr 8, 2022 • 40 min Thriller • Apr 8, 2022 • 40 min Thriller • Apr 8, 2022 • 40 min Thriller • Apr 8, 2022 • 40 min Thriller • Apr 8, 2022 • 40 min",
                        buttonTitle: "Сгенерировать")
    ]
    
    return CellsScreenDataSource(models: models) { (model, cell) in
      guard let cell = cell as? FilmViewCell else {
        return
      }
      cell.configureCellWith(backgroundImage: model.backgroundImage,
                             titleCell: model.titleCell,
                             title: model.title,
                             description: model.description,
                             buttonTitle: model.buttonTitle,
                             buttonAction: model.buttonAction)
    }
  }
}
