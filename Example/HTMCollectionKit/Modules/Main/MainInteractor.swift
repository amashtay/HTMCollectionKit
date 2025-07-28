//
//  MainInteractor.swift
//  HTMCollectionKit
//
//  Created by amashtay on 09.07.2025.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import Foundation

final class MainInteractor: MainInteractorInput {
    private let advertService: AdvertServiceProtocol
    private let recommendationsService: RecommendationsServiceProtocol
    private let bannersService: BannersServiceProtocol
    private let reviewsService: ReviewsServiceProtocol
    private let tagsService: TagsServiceProtocol
    
    // MARK: - Initializer
    init(
        advertService: AdvertServiceProtocol,
        recommendationsService: RecommendationsServiceProtocol,
        bannersService: BannersServiceProtocol,
        reviewsService: ReviewsServiceProtocol,
        tagsService: TagsServiceProtocol
    ) {
        self.advertService = advertService
        self.recommendationsService = recommendationsService
        self.bannersService = bannersService
        self.reviewsService = reviewsService
        self.tagsService = tagsService
    }
    
    // MARK: - MainInteractorInput
    func loadData() async -> MainModel {
        async let advertPromise = advertService.loadCurrentAdvert()
        async let recommendationsPromise = recommendationsService.loadRecommendations()
        async let bannersPromise = bannersService.loadBanners()
        async let reviewsPromise = reviewsService.loadReviews()
        
        let (
            advert,
            recommendations,
            banners,
            reviews
        ) = await (
            advertPromise,
            recommendationsPromise,
            bannersPromise,
            reviewsPromise
        )
        
        return MainModel(
            advertId: advert.advertId,
            backendColorName: advert.backendColorName,
            title: advert.title,
            price: advert.price,
            description: advert.description,
            recommendations: recommendations,
            banners: banners,
            reviews: reviews,
            tags: []
        )
    }
    
    func appendTags(model: MainModel) async -> MainModel {
        var result = model
        let tags = await tagsService.loadTags()
        result.tags = tags
        
        return result
    }
    
    func updateReview() async -> [Review] {
        let reviews = await reviewsService.updateReviews()
        
        return reviews
    }
}
