//
//  MainViewData.swift
//  HTMCollectionKit
//
//  Created by amashtayon 08.07.2025.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import Foundation

struct MainViewData {
    var sections: [MainViewSectionData]
}

struct MainViewSectionData: Hashable {
    enum SectionLayoutType: Hashable {
        case banners
        case description
        case itemsGrid
        case reviews
    }
    
    enum ItemType: Hashable {
        case banner(BannerCellItem)
        case description(DescriptionCellItem)
        case gridItem(AdvertCardCellItem)
        case review(ReviewCellItem)
    }
    
    let uuid = UUID()
    let type: SectionLayoutType
    let title: String?
    let items: [ItemType]
    
    // MARK: Hashable
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
    
    static func == (lhs: MainViewSectionData, rhs: MainViewSectionData) -> Bool {
        lhs.uuid == rhs.uuid
    }
}
