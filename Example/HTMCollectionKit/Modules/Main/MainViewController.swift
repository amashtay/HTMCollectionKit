//
//  MainViewController.swift
//  HTMCollectionKit
//
//  Created by amashtay on 07/08/2025.
//  Copyright (c) 2025 amashtay. All rights reserved.
//

import HTMCollectionKit
import UIKit

final class MainViewController: UIViewController {
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let presenter: MainViewOutput
    private let collectionLayoutFactory: CollectionLayoutFactoryProtocol
    
    private var viewData = MainViewData(sections: [])
    private lazy var dataSource = MainViewDataSource(collectionView: collectionView)
    
    // MARK: Initializers
    
    init(
        presenter: MainViewOutput,
        collectionLayoutFactory: CollectionLayoutFactoryProtocol
    ) {
        self.presenter = presenter
        self.collectionLayoutFactory = collectionLayoutFactory
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View's lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        presenter.onViewDidLoad()
    }
}

// MARK: - MainViewInput
extension MainViewController: MainViewInput {
    func update(viewData: MainViewData) {
        self.viewData = viewData
        
        dataSource.update(with: viewData)
    }
}

// MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch viewData.sections[indexPath.section].items[indexPath.item] {
        case let .gridItem(cellItem):
            cellItem.onTouched?()
        case let .review(cellItem):
            cellItem.onTouched?()
        case let .banner(cellItem):
            cellItem.onTouched?()
        default:
            break
        }
    }
}

// MARK: - Private
private extension MainViewController {
    func setupView() {
        setupCollectionView()
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupCollectionView() {
        collectionView.collectionViewLayout = createCollectionLayout()
        collectionView.delegate = self
    }
    
    func createCollectionLayout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ -> NSCollectionLayoutSection? in
            guard let self, sectionIndex < viewData.sections.count else { return nil }
            
            let layoutSection: NSCollectionLayoutSection?
            let sectionViewData = viewData.sections[sectionIndex]
            let isHeaderHidden = sectionViewData.title?.isEmpty ?? true
            
            switch sectionViewData.type {
            case .description:
                layoutSection = collectionLayoutFactory.createLayoutSection(
                    type: .verticalList(),
                    isHeaderHidden: isHeaderHidden
                )
                layoutSection?.contentInsets = .init(top: 16.0, leading: 8.0, bottom: 32.0, trailing: 8.0)
            case .itemsGrid:
                layoutSection = collectionLayoutFactory
                    .createLayoutSection(
                        type: .grid(
                            columnsCount: 2,
                            customInterItemSpacing: 8.0
                        ),
                        isHeaderHidden: isHeaderHidden
                    )
                layoutSection?.contentInsets = .init(top: 16.0, leading: 8.0, bottom: 32.0, trailing: 8.0)
                layoutSection?.interGroupSpacing = 8.0
            case .banners:
                layoutSection = collectionLayoutFactory.createLayoutSection(
                    type: .horizontalList(
                        customItemWidth: .flexible(0.95),
                        customItemHeight: .absolute(250.0),
                        scrollBehavior: .groupPagingCentered
                    ),
                    isHeaderHidden: isHeaderHidden
                )
                layoutSection?.contentInsets = .init(top: 16.0, leading: 8.0, bottom: 8.0, trailing: 8.0)
                layoutSection?.interGroupSpacing = 4.0
            case .reviews:
                layoutSection = collectionLayoutFactory.createLayoutSection(
                    type: .verticalList(),
                    isHeaderHidden: isHeaderHidden
                )
                layoutSection?.contentInsets = .init(top: 16.0, leading: 8.0, bottom: 32.0, trailing: 8.0)
                layoutSection?.interGroupSpacing = 8.0
            }
            
            return layoutSection
        }
    }
}
