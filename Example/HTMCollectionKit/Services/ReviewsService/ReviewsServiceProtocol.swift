//
//  ReviewsServiceProtocol.swift
//  HTMCollectionKit
//
//  Created by amashtay on 10.07.2025.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import Foundation

protocol ReviewsServiceProtocol: AnyObject {
    func loadReviews() async -> [Review]
    func updateReviews() async -> [Review]
}
