//
//  CollectionLayoutFactoryProtocol.swift
//  HTMCollectionKit
//
//  Created by amashtay on 08.07.2025.
//

import UIKit

public enum CustomItemDimensionSize {
    case absolute(CGFloat)
    case flexible(CGFloat)
    case estimated(CGFloat)
}

public struct HeaderConfiguration {
    public let headerWidthDimensionSize: CustomItemDimensionSize
    public let headerHeightDimensionSize: CustomItemDimensionSize
    
    public init(
        headerWidthDimensionSize: CustomItemDimensionSize = .flexible(1.0),
        headerHeightDimensionSize: CustomItemDimensionSize = .estimated(44.0)
    ) {
        self.headerWidthDimensionSize = headerWidthDimensionSize
        self.headerHeightDimensionSize = headerHeightDimensionSize
    }
}

public enum CollectionLayoutSectionType {
    case grid(columnsCount: Int, customInterItemSpacing: CGFloat? = nil, customItemHeight: CustomItemDimensionSize? = nil)
    case verticalList(customItemHeight: CustomItemDimensionSize? = nil)
    case horizontalList(
        customItemWidth: CustomItemDimensionSize? = nil,
        customItemHeight: CustomItemDimensionSize? = nil,
        scrollBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior = .continuous
    )
}

public protocol CollectionLayoutFactoryProtocol: AnyObject {
    func createLayoutSection(
        type: CollectionLayoutSectionType,
        headerConfiguration: HeaderConfiguration?
    ) -> NSCollectionLayoutSection?
}

