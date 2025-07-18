//
//  RecommendationsService.swift
//  HTMCollectionKit
//
//  Created by amashtayon 08.07.2025.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import Foundation

final class RecommendationsService: RecommendationsServiceProtocol {
    func loadRecommendations() async -> [RecommendationAdvert] {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        
        return [
            RecommendationAdvert(
                title: "Lorem ipsum dolor sit amet",
                price: "1 000 $",
                backendColorName: "red"
            ),
            RecommendationAdvert(
                title: "Sed ut perspiciatis unde omnis iste natus",
                price: "34 000 $",
                backendColorName: "orange"
            ),
            RecommendationAdvert(
                title: "At vero eos et accusamus et iusto odio",
                price: "100 $",
                backendColorName: "yellow"
            ),
            RecommendationAdvert(
                title: "Et harum quidem rerum facilis est et expedita",
                price: "9 000 $",
                backendColorName: "green"
            ),
            RecommendationAdvert(
                title: "Temporibus autem quibusdam et aut officiis",
                price: "5 000 $",
                backendColorName: "cyan"
            ),
            RecommendationAdvert(
                title: "Itaque earum rerum hic tenetur a sapiente delectus",
                price: "65 000 $",
                backendColorName: "blue"
            )
        ]
    }
}
