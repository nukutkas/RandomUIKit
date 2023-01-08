//
//  MainCardTableViewCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 01.05.2022.
//

import UIKit
import RandomUIKit

// MARK: - MainCardTableViewCell

final class MainCardTableViewCell: UITableViewCell {
    
    // MARK: - Private properties
    
    private let cardView = MainCardView()
    private let titleLabel = UILabel()
    
    // MARK: - Initilisation
    
    public override init(style: CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureLayout()
        applyDefaultBehavior()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Public func
    
    /// Настраиваем ячейку
    /// - Parameters:
    ///  - titleCell: Заголовок для ячейки
    ///  - imageCard: Иконка на карточке
    ///  - titleCard: Заголовок на карточке
    ///  - isShowADVLabel: Включить рекламный лайбл
    ///  - titleADVText: Заголовок на рекламном лайбле
    ///  - isDisabled: Карточка выключена
    public func configureCellWith(titleCell: String?,
                                  imageCard: UIImage?,
                                  titleCard: String?,
                                  isShowADVLabel: Bool,
                                  titleADVText: String?,
                                  isDisabled: Bool) {
        titleLabel.text = titleCell
        
        cardView.configureWith(imageCard: imageCard,
                               titleCard: titleCard,
                               isShowADVLabel: isShowADVLabel,
                               titleADVText: titleADVText,
                               isDisabled: isDisabled)
    }
    
    // MARK: - Private func
    
    private func configureLayout() {
        let appearance = Appearance()
        
        [cardView, titleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: appearance.insets),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            cardView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: appearance.insets),
            cardView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -appearance.insets)
        ])
        
    }
    
    private func applyDefaultBehavior() {
        backgroundColor = RandomColor.primaryWhite
        selectionStyle = .none
        
        titleLabel.textColor = .black
    }
}

// MARK: - Appearance

private extension MainCardTableViewCell {
    struct Appearance {
        let insets: CGFloat = 16
    }
}
