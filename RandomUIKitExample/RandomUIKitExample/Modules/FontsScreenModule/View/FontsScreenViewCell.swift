//
//  FontsScreenViewCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit
import RandomUIKit

/// ViewCell для экрана
final class FontsScreenViewCell: UITableViewCell {
    
    // MARK: - Private properties
    
    private let titleLabel = UILabel()
    static let cellIdentifier = FontsScreenViewCell.description()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureLayout()
        applyDefaultBehavior()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal func
    
    func configure(titleText: String, font: UIFont) {
        titleLabel.text = titleText
        titleLabel.font = font
    }
    
    // MARK: - Private func
    
    private func configureLayout() {
        let appearance = Appearance()
        
        [titleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        contentView.removeConstraints(contentView.constraints)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: appearance.titleInsets.left),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: appearance.titleInsets.top),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -appearance.titleInsets.right),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -appearance.titleInsets.bottom)
        ])
    }
    
    private func applyDefaultBehavior() {
        backgroundColor = RandomColor.secondaryWhite
        contentView.backgroundColor = RandomColor.secondaryWhite
        selectionStyle = .none
        
        titleLabel.textAlignment = .center
        titleLabel.lineBreakMode = .byTruncatingMiddle
    }
}

// MARK: - Appearance

private extension FontsScreenViewCell {
    struct Appearance {
        let titleInsets = UIEdgeInsets(top: 16,
                                       left: 16,
                                       bottom: .zero,
                                       right: 16)
    }
}
