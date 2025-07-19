//
//  MainViewDataSource.swift
//  HTMCollectionKit
//
//  Created by amashtayon 08.07.2025.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import UIKit

final class MainViewDataSource: UICollectionViewDiffableDataSource<MainViewSectionData, MainViewSectionData.ItemType> {
    typealias Snapshot = NSDiffableDataSourceSnapshot<MainViewSectionData, MainViewSectionData.ItemType>
    
    // MARK: Init
    init(collectionView: UICollectionView) {
        super.init(collectionView: collectionView) { collectionView, indexPath, item in
            switch item {
            case let .description(model):
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DescriptionCell.cellReuseId, for: indexPath) as? DescriptionCell {
                    cell.configure(model: model)
                    
                    return cell
                }
            case let .gridItem(model):
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdvertCardCell.cellReuseId, for: indexPath) as? AdvertCardCell {
                    cell.configure(model: model)
                    
                    return cell
                }
            case let .banner(model):
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCell.cellReuseId, for: indexPath) as? BannerCell {
                    cell.configure(model: model)
                    
                    return cell
                }
            case let .review(model):
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewCell.cellReuseId, for: indexPath) as? ReviewCell {
                    cell.configure(model: model)
                    
                    return cell
                }
            }
            
            return nil
        }
        
        registerCells(collectionView: collectionView)
        registerSupplementaryItems(collectionView: collectionView)
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        guard kind == UICollectionElementKindSectionHeader,
              let section = self.sectionIdentifier(for: indexPath.section),
              let header = collectionView.dequeueReusableSupplementaryView(
                  ofKind: kind,
                  withReuseIdentifier: TitleHeader.reuseId,
                  for: indexPath
              ) as? TitleHeader
        else {
            return UICollectionReusableView()
        }

        header.configure(title: section.title ?? "")
        
        return header
    }
    
    // MARK: Internal
    func update(with viewData: MainViewData) {
        let sections = viewData.sections
        
        var snapshot = Snapshot()
        snapshot.appendSections(sections)
        sections.forEach { section in
            snapshot.appendItems(section.items, toSection: section)
        }

        apply(snapshot, animatingDifferences: true)
    }
    
    // MARK: Private
    
    private func registerCells(collectionView: UICollectionView) {
        collectionView.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.cellReuseId)
        collectionView.register(ReviewCell.self, forCellWithReuseIdentifier: ReviewCell.cellReuseId)
        collectionView.register(DescriptionCell.self, forCellWithReuseIdentifier: DescriptionCell.cellReuseId)
        collectionView.register(AdvertCardCell.self, forCellWithReuseIdentifier: AdvertCardCell.cellReuseId)
    }
    
    private func registerSupplementaryItems(collectionView: UICollectionView) {
        collectionView.register(
            TitleHeader.self,
            forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
            withReuseIdentifier: TitleHeader.reuseId
        )
    }
}
