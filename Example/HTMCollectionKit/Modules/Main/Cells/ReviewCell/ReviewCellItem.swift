//
//  ReviewCellItem.swift
//  HTMCollectionKit
//
//  Created by amashtayon 10.07.2025.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import Foundation

struct ReviewCellItem: Hashable {
    let uuid = UUID()
    
    let title: String
    let text: String
    let onTouched: (() -> Void)?
    
    // MARK: Hashable
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
    
    static func == (lhs: ReviewCellItem, rhs: ReviewCellItem) -> Bool {
        lhs.uuid == rhs.uuid
    }
}
