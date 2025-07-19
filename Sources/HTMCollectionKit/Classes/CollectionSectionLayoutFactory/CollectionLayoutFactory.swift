//
//  CollectionLayoutFactory.swift
//  HTMCollectionKit
//
//  Created by amashtay on 08.07.2025.
//

import UIKit

public final class CollectionLayoutFactory: CollectionLayoutFactoryProtocol {
    
    public init() {}
    
    // MARK: CollectionLayoutFactoryProtocol
    public func createLayoutSection(
        type: CollectionLayoutSectionType,
        isHeaderHidden: Bool
    ) -> NSCollectionLayoutSection? {
        switch type {
        case let .grid(columnsCount, customSpacing, customItemHeight):
            createGridLayoutSection(
                columnsCount: columnsCount,
                customInterItemSpacing: customSpacing,
                customItemHeight: customItemHeight,
                isHeaderHidden: isHeaderHidden
            )
        case let .verticalList(customItemHeight):
            createGridLayoutSection(
                columnsCount: 1,
                customItemHeight: customItemHeight,
                isHeaderHidden: isHeaderHidden
            )
        case let .horizontalList(customItemWidth, customItemHeight):
            createHorizontalListLayoutSection(
                customItemWidth: customItemWidth,
                customItemHeight: customItemHeight,
                orthogonalScrollingBehavior: .continuous
            )
        case let .horizontalPagingList(customItemWidth, customItemHeight):
            createHorizontalListLayoutSection(
                customItemWidth: customItemWidth,
                customItemHeight: customItemHeight,
                orthogonalScrollingBehavior: .groupPaging
            )
        }
    }
    
    // MARK: Private    
    private func createGridLayoutSection(
        columnsCount: Int = 1,
        customInterItemSpacing: CGFloat? = nil,
        customItemHeight: CustomItemDimensionSize? = nil,
        isHeaderHidden: Bool
    ) -> NSCollectionLayoutSection {
        let itemWidthFraction: NSCollectionLayoutDimension = .fractionalWidth(1.0 / CGFloat(columnsCount))
        let groupWidthFraction: NSCollectionLayoutDimension = .fractionalWidth(1.0)
        
        let itemHeightFraction: NSCollectionLayoutDimension
        let groupHeightFraction: NSCollectionLayoutDimension
        switch customItemHeight {
        case let .absolute(height):
            itemHeightFraction = .absolute(height)
            groupHeightFraction = .absolute(height)
        case let .estimated(height):
            itemHeightFraction = .estimated(height)
            groupHeightFraction = .estimated(height)
        case let .flexible(ratio):
            itemHeightFraction = .fractionalHeight(1.0)
            groupHeightFraction = .fractionalHeight(ratio)
        case .none:
            itemHeightFraction = .estimated(200.0)
            groupHeightFraction = .estimated(200.0)
        }
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: itemWidthFraction,
            heightDimension: itemHeightFraction
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: groupWidthFraction,
            heightDimension: groupHeightFraction
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: columnsCount
        )
        group.interItemSpacing = .fixed(customInterItemSpacing ?? 4.0)
        let section = NSCollectionLayoutSection(group: group)
        if !isHeaderHidden {
            section.boundarySupplementaryItems = [createHeaderLayout()]
        }
        return section
    }
    
    private func createHorizontalListLayoutSection(
        customItemWidth: CustomItemDimensionSize? = nil,
        customItemHeight: CustomItemDimensionSize? = nil,
        orthogonalScrollingBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior
    ) -> NSCollectionLayoutSection {
        let itemWidthFraction: NSCollectionLayoutDimension
        let itemHeightFraction: NSCollectionLayoutDimension
        
        let groupWidthFraction: NSCollectionLayoutDimension
        let groupHeightFraction: NSCollectionLayoutDimension
        
        switch customItemWidth {
        case let .absolute(width):
            itemWidthFraction = .absolute(width)
            groupWidthFraction = .absolute(width)
        case let .estimated(width):
            itemWidthFraction = .estimated(width)
            groupWidthFraction = .estimated(width)
        case let .flexible(ratio):
            itemWidthFraction = .fractionalWidth(1.0)
            groupWidthFraction = .fractionalWidth(ratio)
        case .none:
            itemWidthFraction = .estimated(100.0)
            groupWidthFraction = .estimated(100.0)
        }
        
        switch customItemHeight {
        case let .absolute(height):
            itemHeightFraction = .absolute(height)
            groupHeightFraction = .absolute(height)
        case let .estimated(height):
            itemHeightFraction = .estimated(height)
            groupHeightFraction = .estimated(height)
        case let .flexible(ratio):
            itemHeightFraction = .fractionalHeight(1.0)
            groupHeightFraction = .fractionalHeight(ratio)
        case .none:
            itemHeightFraction = .estimated(120.0)
            groupHeightFraction = .estimated(120.0)
        }
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: itemWidthFraction,
            heightDimension: itemHeightFraction
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: groupWidthFraction,
            heightDimension: groupHeightFraction
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8.0
        section.orthogonalScrollingBehavior = orthogonalScrollingBehavior

        return section
    }
    
    private func createHeaderLayout() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44.0)
        )

        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        return header
    }
}
