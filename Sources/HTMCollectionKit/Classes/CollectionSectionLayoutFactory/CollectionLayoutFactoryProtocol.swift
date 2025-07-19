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

public enum CollectionLayoutSectionType {
    case grid(columnsCount: Int, customInterItemSpacing: CGFloat? = nil, customItemHeight: CustomItemDimensionSize? = nil)
    case verticalList(customItemHeight: CustomItemDimensionSize? = nil)
    case horizontalList(customItemWidth: CustomItemDimensionSize? = nil, customItemHeight: CustomItemDimensionSize? = nil)
    case horizontalPagingList(customItemWidth: CustomItemDimensionSize? = nil, customItemHeight: CustomItemDimensionSize? = nil)
}

public protocol CollectionLayoutFactoryProtocol: AnyObject {
    func createLayoutSection(
        type: CollectionLayoutSectionType,
        isHeaderHidden: Bool
    ) -> NSCollectionLayoutSection?
}
