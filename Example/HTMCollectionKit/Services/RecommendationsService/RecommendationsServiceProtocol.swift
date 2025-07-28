//
//  RecommendationsServiceProtocol.swift
//  HTMCollectionKit
//
//  Created by amashtay on 08.07.2025.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import Foundation

protocol RecommendationsServiceProtocol: AnyObject {
    func loadRecommendations() async -> [RecommendationAdvert]
}
