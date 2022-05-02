//
//  ButtonTableViewCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit
import RandomUIKit

// MARK: - ButtonTableViewCell

public final class ButtonTableViewCell: UITableViewCell {
    
    // MARK: - Private properties
    
    private let buttonView = ButtonView()
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
    ///  - titleButton: Заголовок для кнопки
    ///  - gradientBackground: Градиент цветов для кнопки
    public func configureCellWith(titleCell: String?,
                                  titleButton: String?,
                                  gradientBackground: [UIColor]) {
        titleLabel.text = titleCell
        buttonView.setTitle(titleButton, for: .normal)
        buttonView.gradientBackground = gradientBackground
    }
    
    // MARK: - Private func
    
    private func configureLayout() {
        let appearance = Appearance()
        
        [buttonView, titleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: appearance.insets.top),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            buttonView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                            constant: appearance.insets.top),
            buttonView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                constant: appearance.insets.left),
            buttonView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                 constant: -appearance.insets.right),
            buttonView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                               constant: -appearance.insets.bottom)
        ])
    }
    
    private func applyDefaultBehavior() {
        backgroundColor = .white
        selectionStyle = .none
        
        titleLabel.textColor = .black
        
        buttonView.addTarget(self, action: #selector(buttonViewAction), for: .touchUpInside)
    }
    
    @objc
    private func buttonViewAction() {
        buttonView.setTitle(Appearance().touchUpInsideButton, for: .normal)
    }
}

// MARK: - Appearance

private extension ButtonTableViewCell {
    struct Appearance {
        let insets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        let touchUpInsideButton = "Кнопка была нажата"
    }
}
