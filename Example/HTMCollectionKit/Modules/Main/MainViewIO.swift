//
//  MainViewIO.swift
//  HTMCollectionKit
//
//  Created by amashtay on 08.07.2025.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import Foundation

protocol MainViewInput: AnyObject {
    @MainActor
    func update(viewData: MainViewData) async
}

protocol MainViewOutput: AnyObject {
    func onViewDidLoad()
}

protocol MainInteractorInput: AnyObject {
    func loadData() async -> MainModel
    func appendTags(model: MainModel) async -> MainModel
    func updateReview() async -> [Review] 
}
