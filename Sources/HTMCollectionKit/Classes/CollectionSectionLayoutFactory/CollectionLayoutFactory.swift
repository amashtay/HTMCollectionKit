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
        case let .tagsList(customItemWidth, customItemHeight):
            createTagsLayout(
                customItemWidth: customItemWidth,
                customItemHeight: customItemHeight,
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
        if let customItemHeight {
            itemHeightFraction = mapItemDimensionHeight(customItemHeight: customItemHeight)
            groupHeightFraction = mapGroupDimensionHeight(customItemHeight: customItemHeight)
        } else {
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
        let groupWidthFraction: NSCollectionLayoutDimension
        if let customItemWidth {
            itemWidthFraction = mapItemDimensionWidth(customItemWidth: customItemWidth)
            groupWidthFraction = mapGroupDimensionWidth(customItemWidth: customItemWidth)
        } else {
            itemWidthFraction = .estimated(100.0)
            groupWidthFraction = .estimated(100.0)
        }
        
        let itemHeightFraction: NSCollectionLayoutDimension
        let groupHeightFraction: NSCollectionLayoutDimension
        if let customItemHeight {
            itemHeightFraction = mapItemDimensionHeight(customItemHeight: customItemHeight)
            groupHeightFraction = mapGroupDimensionHeight(customItemHeight: customItemHeight)
        } else {
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
    
    private func createTagsLayout(
        customItemWidth: CustomItemDimensionSize? = nil,
        customItemHeight: CustomItemDimensionSize? = nil,
        customInterItemSpacing: CGFloat? = nil,
        headerConfiguration: HeaderConfiguration?
    ) -> NSCollectionLayoutSection {
        let itemWidthFraction: NSCollectionLayoutDimension
        if let customItemWidth {
            itemWidthFraction = mapItemDimensionWidth(customItemWidth: customItemWidth)
        } else {
            itemWidthFraction = .estimated(100.0)
        }
        
        let itemHeightFraction: NSCollectionLayoutDimension
        if let customItemHeight {
            itemHeightFraction = mapItemDimensionHeight(customItemHeight: customItemHeight)
        } else {
            itemHeightFraction = .estimated(32.0)
        }
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: itemWidthFraction,
            heightDimension: itemHeightFraction
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(200)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        group.interItemSpacing = .fixed(customInterItemSpacing ?? 4.0)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        section.orthogonalScrollingBehavior = .none
        if let headerConfiguration {
            section.boundarySupplementaryItems = [createHeaderLayout(headerConfiguration: headerConfiguration)]
        }

        return section
    }
}

// MARK: - Mapping dimensions
private extension CollectionLayoutFactory {
    private func mapItemDimensionWidth(customItemWidth: CustomItemDimensionSize) -> NSCollectionLayoutDimension {
        let itemWidthDimension: NSCollectionLayoutDimension
        switch customItemWidth {
        case let .absolute(width):
            itemWidthDimension = .absolute(width)
        case let .estimated(width):
            itemWidthDimension = .estimated(width)
        case .flexible:
            itemWidthDimension = .fractionalWidth(1.0)
        }
        
        return itemWidthDimension
    }
    
    private func mapItemDimensionHeight(customItemHeight: CustomItemDimensionSize) -> NSCollectionLayoutDimension {
        let itemHeightDimension: NSCollectionLayoutDimension
        
        switch customItemHeight {
        case let .absolute(height):
            itemHeightDimension = .absolute(height)
        case let .estimated(height):
            itemHeightDimension = .estimated(height)
        case .flexible:
            itemHeightDimension = .fractionalHeight(1.0)
        }
        
        return itemHeightDimension
    }
    
    private func mapGroupDimensionWidth(customItemWidth: CustomItemDimensionSize) -> NSCollectionLayoutDimension {
        let groupWidthDimension: NSCollectionLayoutDimension
        
        switch customItemWidth {
        case let .absolute(width):
            groupWidthDimension = .absolute(width)
        case let .estimated(width):
            groupWidthDimension = .estimated(width)
        case let .flexible(ratio):
            groupWidthDimension = .fractionalWidth(ratio)
        }
        
        return groupWidthDimension
    }
    
    private func mapGroupDimensionHeight(customItemHeight: CustomItemDimensionSize) -> NSCollectionLayoutDimension {
        let groupHeightDimension: NSCollectionLayoutDimension
        
        switch customItemHeight {
        case let .absolute(height):
            groupHeightDimension = .absolute(height)
        case let .estimated(height):
            groupHeightDimension = .estimated(height)
        case let .flexible(ratio):
            groupHeightDimension = .fractionalHeight(ratio)
        }
        
        return groupHeightDimension
    }
}

// MARK: - Header
private extension CollectionLayoutFactory {
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
