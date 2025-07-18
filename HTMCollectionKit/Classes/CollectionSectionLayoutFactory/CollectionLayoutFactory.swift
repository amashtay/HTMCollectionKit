//
//  CollectionLayoutFactory.swift
//  HTMCollectionKit
//
//  Created by amashtayon 08.07.2025.
//

public final class CollectionLayoutFactory: CollectionLayoutFactoryProtocol {
    
    public init() {}
    
    // MARK: CollectionLayoutFactoryProtocol
    public func createLayoutSection(type: CollectionLayoutSectionType) -> NSCollectionLayoutSection? {
        switch type {
        case let .grid(columnsCount, customItemHeight):
            createGridLayoutSection(columnsCount: columnsCount, customItemHeight: customItemHeight)
        case let .verticalList(customItemHeight):
            createGridLayoutSection(columnsCount: 1, customItemHeight: customItemHeight)
        case let .horizontalList(customItemWidth, customItemHeight):
            createHorizontalListLayoutSection(customItemWidth: customItemWidth, customItemHeight: customItemHeight)
        case let .horizontalPagingList(customItemHeight):
            createHorizontalPagingListLayoutSection(customItemHeight: customItemHeight)
        }
    }
    
    // MARK: Private    
    private func createGridLayoutSection(
        columnsCount: Int = 1,
        customItemHeight: CGFloat? = nil
    ) -> NSCollectionLayoutSection {
        let widthFraction: NSCollectionLayoutDimension = .fractionalWidth(1.0 / CGFloat(columnsCount))
        let heightFraction: NSCollectionLayoutDimension
        if let customItemHeight {
            heightFraction = .absolute(customItemHeight)
        } else {
            heightFraction = .estimated(200.0)
        }
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: widthFraction,
            heightDimension: heightFraction
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: heightFraction
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: columnsCount
        )
        group.interItemSpacing = .fixed(4.0)
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    private func createHorizontalListLayoutSection(
        customItemWidth: CGFloat? = nil,
        customItemHeight: CGFloat? = nil
    ) -> NSCollectionLayoutSection {
        let widthFraction: NSCollectionLayoutDimension
        if let customItemWidth {
            widthFraction = .absolute(customItemWidth)
        } else {
            widthFraction = .estimated(100.0)
        }
        
        let heightFraction: NSCollectionLayoutDimension
        if let customItemHeight {
            heightFraction = .absolute(customItemHeight)
        } else {
            heightFraction = .estimated(120.0)
        }
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: widthFraction,
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: widthFraction,
            heightDimension: heightFraction
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8.0
        section.orthogonalScrollingBehavior = .continuous

        return section
    }
    
    private func createHorizontalPagingListLayoutSection(customItemHeight: CGFloat? = nil) -> NSCollectionLayoutSection {
        let heightFraction: NSCollectionLayoutDimension
        if let customItemHeight {
            heightFraction = .absolute(customItemHeight)
        } else {
            heightFraction = .estimated(200.0)
        }
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.9),
            heightDimension: heightFraction
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8.0
        section.orthogonalScrollingBehavior = .groupPaging

        return section
    }
}
