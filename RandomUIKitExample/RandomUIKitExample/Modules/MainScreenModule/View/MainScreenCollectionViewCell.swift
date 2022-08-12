//
//  MainScreenCollectionViewCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 01.05.2022.
//

import UIKit
import RandomUIKit

/// CollectionViewCell для MainScreenView
final class MainScreenCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Internal properties
    
    static let reuseIdentifier = MainScreenCollectionViewCell.description()
    
    // MARK: - Private properties
    
    private let roundedBackgroundView = UIView()
    private let titleLabel = UILabel()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureLayout()
        applyDefaultBehavior()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal func
    
    func configure(with text: String) {
        titleLabel.text = text
    }
    
    // MARK: - Private func
    
    private func configureLayout() {
        [roundedBackgroundView, titleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        contentView.addSubview(roundedBackgroundView)
        roundedBackgroundView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
          roundedBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
          roundedBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
          roundedBackgroundView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
          roundedBackgroundView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
          titleLabel.centerXAnchor.constraint(equalTo: roundedBackgroundView.centerXAnchor),
          titleLabel.centerYAnchor.constraint(equalTo: roundedBackgroundView.centerYAnchor)
        ])
    }
    
    private func applyDefaultBehavior() {
        let appearance = Appearance()
        backgroundColor = RandomColor.primaryWhite
        
        roundedBackgroundView.layer.cornerRadius = appearance.cornerRadius
        roundedBackgroundView.layer.borderColor = RandomColor.secondaryGray.cgColor
        roundedBackgroundView.layer.borderWidth = appearance.borderWidth
        
        titleLabel.font = RandomFont.primaryMedium18
        titleLabel.textColor = RandomColor.primaryBlue
    }
}

// MARK: - Appearance

private extension MainScreenCollectionViewCell {
    struct Appearance {
        let cornerRadius: CGFloat = 10
        let borderWidth: CGFloat = 1
    }
}
