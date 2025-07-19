//
//  MainViewDataFactory.swift
//  HTMCollectionKit
//
//  Created by amashtayon 08.07.2025.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import UIKit

final class MainViewDataFactory: MainViewDataFactoryProtocol {
    func createViewData(
        model: MainModel,
        onItemTouched: ((MainSelection) -> Void)?
    ) -> MainViewData {
        MainViewData(
            sections: [
                .init(
                    type: .banners,
                    title: nil,
                    items: mapBannersData(
                        banners: model.banners,
                        onItemTouched: onItemTouched
                    )
                ),
                .init(
                    type: .description,
                    title: nil,
                    items: mapDescription(model: model)
                ),
                .init(
                    type: .itemsGrid,
                    title: "LOREM IPSUM",
                    items: mapRecommendationsData(
                        recommendations: model.recommendations,
                        onItemTouched: onItemTouched
                    )
                ),
                .init(
                    type: .reviews,
                    title: nil,
                    items: mapReviewsData(
                        reviews: model.reviews,
                        onItemTouched: onItemTouched
                    )
                )
            ]
        )
    }
    
    // MARK: Private
    private func mapDescription(model: MainModel) -> [MainViewSectionData.ItemType] {
        [
            MainViewSectionData.ItemType.description(
                DescriptionCellItem(
                    title: model.title,
                    subtitle: model.price,
                    description: model.description
                )
            )
        ]
    }
    
    private func mapRecommendationsData(
        recommendations: [RecommendationAdvert],
        onItemTouched: ((MainSelection) -> Void)?
    ) -> [MainViewSectionData.ItemType] {
        recommendations.map { recommendation in
            MainViewSectionData.ItemType.gridItem(
                AdvertCardCellItem(
                    color: mapBackendColorName(colorName: recommendation.backendColorName) ?? .lightGray,
                    title: recommendation.title,
                    subtitle: recommendation.price,
                    onTouched: { [recommendation] in
                        onItemTouched?(.recommendation(recommendation))
                    }
                )
            )
        }
    }
    
    private func mapBannersData(
        banners: [Banner],
        onItemTouched: ((MainSelection) -> Void)?
    ) -> [MainViewSectionData.ItemType] {
        banners.map { banner in
            MainViewSectionData.ItemType.banner(
                BannerCellItem(
                    color: mapBackendColorName(colorName: banner.backendColorName) ?? .lightGray,
                    title: banner.title,
                    onTouched: { [banner] in
                        onItemTouched?(.banner(banner))
                    }
                )
            )
        }
    }
    
    private func mapReviewsData(
        reviews: [Review],
        onItemTouched: ((MainSelection) -> Void)?
    ) -> [MainViewSectionData.ItemType] {
        reviews.map { review in
            MainViewSectionData.ItemType
                .review(
                    ReviewCellItem(
                        title: review.title,
                        text: review.text,
                        onTouched: { [review] in
                            onItemTouched?(.review(review))
                        }
                    )
                )
        }
    }
    
    private func mapBackendColorName(colorName: String?) -> UIColor? {
        let color: UIColor?
        switch colorName {
        case "red":
            color = .red
        case "orange":
            color = .orange
        case "yellow":
            color = .yellow
        case "green":
            color = .green
        case "cyan":
            color = .cyan
        case "blue":
            color = .blue
        case "magenta":
            color = .magenta
        default:
            color = nil
        }
        
        return color?.withAlphaComponent(0.25)
    }
}
