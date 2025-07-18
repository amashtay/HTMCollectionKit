//
//  MainModel.swift
//  HTMCollectionKit
//
//  Created by amashtayon 08.07.2025.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import Foundation

struct MainModel {
    let advertId: String
    let backendColorName: String?
    let title: String?
    let price: String?
    let description: String?
    var recommendations: [RecommendationAdvert]
    var banners: [Banner]
    var reviews: [Review]
}
