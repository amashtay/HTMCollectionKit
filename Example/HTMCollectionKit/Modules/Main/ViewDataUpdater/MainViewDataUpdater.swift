//
//  MainViewDataUpdater.swift
//  HTMCollectionKit
//
//  Created by amashtay on 7/28/25.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import UIKit

final class MainViewDataUpdater: MainViewDataUpdaterProtocol {
    func insertTagsSection(
        viewData: MainViewData,
        tagSection: MainViewSectionData
    ) -> MainViewData {
        var sections = viewData.sections
        let descriptionSectionIndex = sections.firstIndex { section in
            section.type == .description
        }
        
        guard
            let descriptionSectionIndex,
            descriptionSectionIndex + 1 < sections.count
        else {
            return viewData
        }
        
        sections.insert(tagSection, at: descriptionSectionIndex + 1)
        return MainViewData(sections: sections)
    }
    
    func updateDescription(
        viewData: MainViewData,
        review: String
    ) -> MainViewData {
        var sections = viewData.sections
        
        guard
            let reviewSectionIndex = sections.firstIndex(where: { section in section.type == .reviews })
        else {
            return viewData
        }
        
        switch sections[reviewSectionIndex].items[0] {
        case let .review(reviewItem):
            sections[reviewSectionIndex]
                .items[0] = .review(
                    ReviewCellItem(
                        title: reviewItem.title,
                        text: review,
                        onTouched: reviewItem.onTouched
                    )
                )
        default:
            break
        }
        
        return MainViewData(sections: sections)
    }
}
