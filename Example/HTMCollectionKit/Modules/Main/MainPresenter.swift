//
//  MainPresenter.swift
//  HTMCollectionKit
//
//  Created by amashtayon 08.07.2025.
//  Copyright © 2025 CocoaPods. All rights reserved.
//


import Foundation

final class MainPresenter: MainViewOutput, MainModuleIO {
    var onFinish: (() -> Void)?
    
    weak var view: MainViewInput?
    
    private var viewData = MainViewData(sections: [])
    private var model: MainModel?
    
    private let viewDataFactory: MainViewDataFactoryProtocol
    private let interactor: MainInteractorInput
    
    // MARK: - Initializer
    
    init(
        viewDataFactory: MainViewDataFactoryProtocol,
        interactor: MainInteractorInput
    ) {
        self.viewDataFactory = viewDataFactory
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
            
            view?.update(viewData: viewData)
        }
    }
}
