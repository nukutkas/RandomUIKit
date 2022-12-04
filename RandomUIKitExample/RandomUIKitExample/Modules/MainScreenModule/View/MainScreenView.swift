//
//  MainScreenView.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 01.05.2022.
//

import UIKit
import RandomUIKit

/// События которые отправляем из View в Presenter
protocol MainScreenViewOutput: AnyObject {
    
    /// Открыть раздел `Colors`
    func openColors()
    
    /// Открыть раздел `Fonts`
    func openFonts()
    
    /// Открыть раздел `Cells & Views`
    func openCells()
}

/// События которые отправляем от Presenter ко View
protocol MainScreenViewInput: AnyObject {
    
    /// Настройка главного экрана
    ///  - Parameter cells: Список ячеек
    func configureWith(cells: [MainScreenCell])
}

/// Псевдоним протокола UIView & MainScreenViewInput
typealias MainScreenViewProtocol = UIView & MainScreenViewInput

/// View для экрана
final class MainScreenView: MainScreenViewProtocol {
    
    // MARK: - Internal properties
    
    weak var output: MainScreenViewOutput?
    
    // MARK: - Private properties
    
    private let collectionViewLayout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(frame: .zero,
                                                       collectionViewLayout: collectionViewLayout)
    private var cells: [MainScreenCell] = []
    
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
    
    func configureWith(cells: [MainScreenCell]) {
        self.cells = cells
        collectionView.reloadData()
    }
    
    // MARK: - Private func
    
    private func configureLayout() {
        let appearance = Appearance()
        
        [collectionView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: appearance.collectionViewInsets.top),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: appearance.collectionViewInsets.left),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -appearance.collectionViewInsets.right),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -appearance.collectionViewInsets.bottom),
        ])
    }
    
    private func applyDefaultBehavior() {
        let appearance = Appearance()
        
        backgroundColor = RandomColor.primaryWhite
        collectionView.backgroundColor = RandomColor.primaryWhite
        
        collectionView.alwaysBounceVertical = true
        collectionView.register(MainScreenCollectionViewCell.self,
                                forCellWithReuseIdentifier: MainScreenCollectionViewCell.reuseIdentifier)
        
        collectionViewLayout.sectionInset = appearance.sectionInset
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.minimumInteritemSpacing = .zero
        collectionViewLayout.minimumLineSpacing = .zero
        collectionViewLayout.itemSize = CGSize(width: appearance.cellWidthHeightConstant,
                                               height: appearance.cellWidthHeightConstant)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDelegate

extension MainScreenView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = cells[indexPath.row]
        switch item {
        case .colors:
            output?.openColors()
        case .fonts:
            output?.openFonts()
        case .cells:
            output?.openCells()
        }
    }
}

// MARK: - UICollectionViewDataSource

extension MainScreenView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MainScreenCollectionViewCell.reuseIdentifier,
            for: indexPath
        ) as? MainScreenCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: cells[indexPath.row].rawValue)
        return cell
    }
}

// MARK: - Appearance

private extension MainScreenView {
    struct Appearance {
        let collectionViewInsets: UIEdgeInsets = .zero
        let estimatedRowHeight: CGFloat = 95
        let sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        let cellWidthHeightConstant = UIScreen.main.bounds.width * 0.4
    }
}
