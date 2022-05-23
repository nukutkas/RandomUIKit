//
//  CustomPaddingCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 24.05.2022.
//

import UIKit

// MARK: - CustomPaddingCell

final class CustomPaddingCell: UITableViewCell {
    
    // MARK: - Public property
    
    /// Identifier для ячейки
    public static let reuseIdentifier = CustomPaddingCell.description()
    
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
    ///  - height: Высота ячейки
    ///  - titleText: Заголовок ячейки
    public func configureCellWith(height: CGFloat, titleText: String?) {
        titleLabel.text = titleText
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: height),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        setNeedsLayout()
    }
    
    // MARK: - Private func
    
    private func configureLayout() {
        [titleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
    }
    
    private func applyDefaultBehavior() {
        backgroundColor = .lightGray
        selectionStyle = .none
    }
}
