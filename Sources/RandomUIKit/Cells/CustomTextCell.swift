//
//  CustomTextCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 22.05.2022.
//

import UIKit

// MARK: - CustomTextCell

public final class CustomTextCell: UITableViewCell {
    
    // MARK: - Public property
    
    /// Identifier для ячейки
    public static let reuseIdentifier = CustomTextCell.description()
    
    // MARK: - Private property
    
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
    ///  - titleText: Текст заголовка
    ///  - textColor: Цвет текста
    ///  - textAlignment: Выравнивание текста
    public func configureCellWith(titleText: String?, textColor: UIColor?, textAlignment: NSTextAlignment) {
        titleLabel.text = titleText
        titleLabel.textColor = textColor
        titleLabel.textAlignment = textAlignment
    }
    
    // MARK: - Private func
    
    private func configureLayout() {
        let appearance = Appearance()
        
        [titleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                constant: appearance.insets.left),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,
                                            constant: appearance.insets.top),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                 constant: -appearance.insets.right),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                               constant: -appearance.insets.bottom)
        ])
    }
    
    private func applyDefaultBehavior() {
        backgroundColor = RandomColor.secondaryWhite
        selectionStyle = .none
        
        titleLabel.font = RandomFont.primaryMedium18
        titleLabel.textColor = RandomColor.primaryGray
        titleLabel.textAlignment = .center
    }
}

// MARK: - Appearance

private extension CustomTextCell {
    struct Appearance {
        let insets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    }
}
