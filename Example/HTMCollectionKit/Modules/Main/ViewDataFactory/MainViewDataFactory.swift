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
                    title: "ADVERTISEMENTS",
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
                    type: .tags,
                    title: nil,
                    items: [
                        .tag(.init(title: "люк")),
                        .tag(.init(title: "спойлер")),
                        .tag(.init(title: "обвес")),
                        .tag(.init(title: "велюр")),
                        .tag(.init(title: "аудиосистема")),
                        .tag(.init(title: "bluetooth")),
                        .tag(.init(title: "MP3")),
                        .tag(.init(title: "ГУР")),
                        .tag(.init(title: "кондиционер")),
                        .tag(.init(title: "мультируль")),
                        .tag(.init(title: "налог уплачен")),
                        .tag(.init(title: "техосмотр пройден")),
                        .tag(.init(title: "Lorem ipsum")),
                        .tag(.init(title: "8")),
                        .tag(.init(title: "Dolor sit amet")),
                        .tag(.init(title: "Consectetur adipiscing")),
                        .tag(.init(title: "Elit sed do")),
                        .tag(.init(title: "Eiusmod tempor")),
                        .tag(.init(title: "Incididunt ut labore")),
                        .tag(.init(title: "Et dolore magna")),
                        .tag(.init(title: "Aliqua ut enim")),
                        .tag(.init(title: "Ad minim veniam")),
                        .tag(.init(title: "Quis nostrud exercitation")),
                        .tag(.init(title: "Ullamco laboris nisi")),
                        .tag(.init(title: "Ut aliquip ex ea")),
                        .tag(.init(title: "Commodo consequat")),
                        .tag(.init(title: "Duis aute irure")),
                        .tag(.init(title: "Dolor in reprehenderit")),
                        .tag(.init(title: "In voluptate velit")),
                        .tag(.init(title: "Esse cillum dolore")),
                        .tag(.init(title: "Eu fugiat nulla")),
                        .tag(.init(title: "Pariatur excepteur sint")),
                        .tag(.init(title: "Occaecat cupidatat non"))
                    ]
                ),
                .init(
                    type: .itemsGrid,
                    title: "RECOMMENDED",
                    items: mapRecommendationsData(
                        recommendations: model.recommendations,
                        onItemTouched: onItemTouched
                    )
                ),
                .init(
                    type: .reviews,
                    title: "REVIEWS",
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
