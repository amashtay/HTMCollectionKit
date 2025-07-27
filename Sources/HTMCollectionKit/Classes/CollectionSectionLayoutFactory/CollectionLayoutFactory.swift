//
//  CollectionLayoutFactory.swift
//  HTMCollectionKit
//
//  Created by amashtay on 08.07.2025.
//

import UIKit

public final class CollectionLayoutFactory: CollectionLayoutFactoryProtocol {
    
    public init() {}
    
    // MARK: - CollectionLayoutFactoryProtocol
    
    public func createLayoutSection(
        type: CollectionLayoutSectionType,
        headerConfiguration: HeaderConfiguration?
    ) -> NSCollectionLayoutSection? {
        switch type {
        case let .grid(columnsCount, customSpacing, customItemHeight):
            createGridLayoutSection(
                columnsCount: columnsCount,
                customInterItemSpacing: customSpacing,
                customItemHeight: customItemHeight,
                headerConfiguration: headerConfiguration
            )
        case let .verticalList(customItemHeight):
            createGridLayoutSection(
                columnsCount: 1,
                customItemHeight: customItemHeight,
                headerConfiguration: headerConfiguration
            )
        case let .horizontalList(customItemWidth, customItemHeight, orthogonalScrollingBehavior):
            createHorizontalListLayoutSection(
                customItemWidth: customItemWidth,
                customItemHeight: customItemHeight,
                orthogonalScrollingBehavior: orthogonalScrollingBehavior,
                headerConfiguration: headerConfiguration
            )
        }
    }
    
    // MARK: - Private
    
    private func createGridLayoutSection(
        columnsCount: Int = 1,
        customInterItemSpacing: CGFloat? = nil,
        customItemHeight: CustomItemDimensionSize? = nil,
        headerConfiguration: HeaderConfiguration?
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
        if let headerConfiguration {
            section.boundarySupplementaryItems = [createHeaderLayout(headerConfiguration: headerConfiguration)]
        }
        return section
    }
    
    private func createHorizontalListLayoutSection(
        customItemWidth: CustomItemDimensionSize? = nil,
        customItemHeight: CustomItemDimensionSize? = nil,
        orthogonalScrollingBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior,
        headerConfiguration: HeaderConfiguration?
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
        if let headerConfiguration {
            section.boundarySupplementaryItems = [createHeaderLayout(headerConfiguration: headerConfiguration)]
        }
        
        return section
    }
    
    private func createHeaderLayout(
        headerConfiguration: HeaderConfiguration
    ) -> NSCollectionLayoutBoundarySupplementaryItem {
        
        let widthDimension: NSCollectionLayoutDimension
        switch headerConfiguration.headerWidthDimensionSize {
        case let .absolute(absoluteWidth):
            widthDimension = .absolute(absoluteWidth)
        case let .estimated(estimatedWidth):
            widthDimension = .estimated(estimatedWidth)
        case let .flexible(ratio):
            widthDimension = .fractionalWidth(ratio)
        }
        
        let heightDimension: NSCollectionLayoutDimension
        switch headerConfiguration.headerHeightDimensionSize {
        case let .absolute(absoluteHeight):
            heightDimension = .absolute(absoluteHeight)
        case let .estimated(estimatedHeight):
            heightDimension = .estimated(estimatedHeight)
        case let .flexible(ratio):
            heightDimension = .fractionalWidth(ratio)
        }
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: widthDimension,
            heightDimension: heightDimension
        )

        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        return header
    }
}
