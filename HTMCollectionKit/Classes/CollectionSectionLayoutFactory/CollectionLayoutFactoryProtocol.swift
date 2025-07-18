//
//  CollectionLayoutFactoryProtocol.swift
//  HTMCollectionKit
//
//  Created by amashtay on 08.07.2025.
//

import UIKit

public enum CollectionLayoutSectionType {
    case grid(columnsCount: Int, customItemHeight: CGFloat? = nil)
    case verticalList(customItemHeight: CGFloat? = nil)
    case horizontalList(customItemWidth: CGFloat? = nil, customItemHeight: CGFloat? = nil)
    case horizontalPagingList(customItemHeight: CGFloat? = nil)
}

public protocol CollectionLayoutFactoryProtocol: AnyObject {
    func createLayoutSection(type: CollectionLayoutSectionType) -> NSCollectionLayoutSection?
}
