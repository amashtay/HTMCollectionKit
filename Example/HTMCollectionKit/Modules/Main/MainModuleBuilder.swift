//
//  MainModuleBuilder.swift
//  HTMCollectionKit
//
//  Created by amashtay on 08.07.2025.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import HTMCollectionKit
import UIKit

enum MainModuleBuilder {
    static func build() -> MainModule {
        let presenter = MainPresenter(
            viewDataFactory: makeMainViewDataFactory(),
            viewDataUpdater: makeMainViewDataUpdater(),
            interactor: makeMainInteractor()
        )
        let viewController = MainViewController(
            presenter: presenter,
            collectionLayoutFactory: makeCollectionLayoutFactory()
        )
        presenter.view = viewController
        
        return MainModule(
            moduleIO: presenter,
            viewController: viewController
        )
    }
    
    // MARK: Private
    
    private static func makeMainInteractor() -> MainInteractorInput {
        MainInteractor(
            advertService: AdvertService(),
            recommendationsService: RecommendationsService(),
            bannersService: BannersService(),
            reviewsService: ReviewsService(),
            tagsService: TagsService()
        )
    }
    
    private static func makeMainViewDataFactory() -> MainViewDataFactoryProtocol {
        MainViewDataFactory()
    }
    
    private static func makeMainViewDataUpdater() -> MainViewDataUpdaterProtocol {
        MainViewDataUpdater()
    }
    
    private static func makeCollectionLayoutFactory() -> CollectionLayoutFactoryProtocol {
        CollectionLayoutFactory()
    }
}
