//
//  MainCardTableViewCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 01.05.2022.
//

import UIKit

// MARK: - MainCardTableViewCell

public final class MainCardTableViewCell: UITableViewCell {
    
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
    
    /// Настройка ячейки
    public func configureCellWith(text: String?) {
        titleLabel.text = text
    }
    
    // MARK: - Private func
    
    private func configureLayout() {
        let appearance = Appearance()
        
        [cardView, titleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: appearance.insets),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            cardView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: appearance.insets),
            cardView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -appearance.insets)
        ])
        
    }
    
    private func applyDefaultBehavior() {
        backgroundColor = .white
        selectionStyle = .none
        
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 3
    }
}

// MARK: - Appearance

private extension MainCardTableViewCell {
    struct Appearance {
        let insets: CGFloat = 16
    }
}
