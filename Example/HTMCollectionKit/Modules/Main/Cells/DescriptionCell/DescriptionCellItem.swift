//
//  DescriptionCellItem.swift
//  HTMCollectionKit
//
//  Created by amashtay on 09.07.2025.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import Foundation

struct DescriptionCellItem: Hashable {
    let uuid = UUID()
    
    let title: String?
    let subtitle: String?
    let description: String?
    
    // MARK: Hashable
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
    
    static func == (lhs: DescriptionCellItem, rhs: DescriptionCellItem) -> Bool {
        lhs.uuid == rhs.uuid
    }
}
