//
//  BannerCellItem.swift
//  HTMCollectionKit
//
//  Created by amashtay on 08.07.2025.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import UIKit

struct BannerCellItem: Hashable {
    let uuid: UUID = UUID()
    let color: UIColor
    let title: String
    let onTouched: (() -> Void)?
    
    init(
        color: UIColor = .systemBlue.withAlphaComponent(0.5),
        title: String,
        onTouched: (() -> Void)?
    ) {
        self.color = color
        self.title = title
        self.onTouched = onTouched
    }
    
    // MARK: Hashable
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
    
    static func == (lhs: BannerCellItem, rhs: BannerCellItem) -> Bool {
        lhs.uuid == rhs.uuid
    }
}
