//
//  TagCellItem.swift
//  HTMCollectionKit
//
//  Created by amashtay on 7/27/25.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import Foundation

struct TagCellItem: Hashable {
    let uuid = UUID()
    let title: String
    
    // MARK: Hashable
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
    
    static func == (lhs: TagCellItem, rhs: TagCellItem) -> Bool {
        lhs.uuid == rhs.uuid
    }
}
