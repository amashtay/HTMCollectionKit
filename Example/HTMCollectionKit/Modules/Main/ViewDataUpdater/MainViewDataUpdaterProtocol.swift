//
//  MainViewDataUpdaterProtocol.swift
//  HTMCollectionKit
//
//  Created by amashtay on 7/28/25.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import UIKit

protocol MainViewDataUpdaterProtocol: AnyObject {
    func insertTagsSection(
        viewData: MainViewData,
        tagSection: MainViewSectionData
    ) -> MainViewData
    
    func updateDescription(
        viewData: MainViewData,
        review: String
    ) -> MainViewData
}
