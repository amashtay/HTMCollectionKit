//
//  TagsServiceProtocol.swift
//  HTMCollectionKit
//
//  Created by amashtay on 7/28/25.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import Foundation

protocol TagsServiceProtocol: AnyObject {
    func loadTags() async -> [String]
}
