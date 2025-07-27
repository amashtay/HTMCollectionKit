//
//  MainPresenter.swift
//  HTMCollectionKit
//
//  Created by amashtay on 08.07.2025.
//  Copyright © 2025 CocoaPods. All rights reserved.
//


import Foundation

final class MainPresenter: MainViewOutput, MainModuleIO {
    var onFinish: (() -> Void)?
    
    weak var view: MainViewInput?
    
    private var viewData = MainViewData(sections: [])
    private var model: MainModel?
    
    private let viewDataFactory: MainViewDataFactoryProtocol
    private let viewDataUpdater: MainViewDataUpdaterProtocol
    private let interactor: MainInteractorInput
    
    // MARK: - Initializer
    
    init(
        viewDataFactory: MainViewDataFactoryProtocol,
        viewDataUpdater: MainViewDataUpdaterProtocol,
        interactor: MainInteractorInput
    ) {
        self.viewDataFactory = viewDataFactory
        self.viewDataUpdater = viewDataUpdater
        self.interactor = interactor
    }
    
    // MARK: - MainViewOutput
    
    func onViewDidLoad() {
        Task { @MainActor in
            let model = await interactor.loadData()
            self.model = model
            
            viewData = viewDataFactory.createViewData(
                model: model,
                onItemTouched: { itemType in
                    switch itemType {
                    case let .banner(bannerModel):
                        print("[TEST]: banner \(bannerModel.title) touched")
                    case let .recommendation(recommendationModel):
                        print("[TEST]: recommendation \(recommendationModel.title) touched")
                    case let .review(reviewModel):
                        print("[TEST]: review \(reviewModel.title) touched")
                    }
                }
            )
            await view?.update(viewData: viewData)
            
            try? await Task.sleep(nanoseconds: 4_000_000_000)
            
            let newModel = await interactor.appendTags(model: model)
            self.model = newModel
            let newTagsSection = viewDataFactory.createTagsSection(tags: newModel.tags)
            viewData = viewDataUpdater.insertTagsSection(viewData: viewData, tagSection: newTagsSection)
            
            await view?.update(viewData: viewData)
        }
    }
}
