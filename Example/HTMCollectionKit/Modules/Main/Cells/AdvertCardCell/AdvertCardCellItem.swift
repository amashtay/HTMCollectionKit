//
//  AdvertCardCellItem.swift
//  HTMCollectionKit
//
//  Created by amashtay on 08.07.2025.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import UIKit

struct AdvertCardCellItem: Hashable {
    let uuid = UUID()
    
    let color: UIColor
    let title: String
    let subtitle: String?
    let onTouched: (() -> Void)?
    
    // MARK: Init
    
    init(
        color: UIColor = .darkGray,
        title: String,
        subtitle: String? = nil,
        onTouched: (() -> Void)?
    ) {
        self.color = color
        self.title = title
        self.subtitle = subtitle
        self.onTouched = onTouched
    }
    
    // MARK: Hashable
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
    
    static func == (lhs: AdvertCardCellItem, rhs: AdvertCardCellItem) -> Bool {
        lhs.uuid == rhs.uuid
    }
}
