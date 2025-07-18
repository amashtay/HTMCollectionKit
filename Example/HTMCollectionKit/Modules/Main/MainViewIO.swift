//
//  MainViewIO.swift
//  HTMCollectionKit
//
//  Created by amashtayon 08.07.2025.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import Foundation

protocol MainViewInput: AnyObject {
    func update(viewData: MainViewData)
}

protocol MainViewOutput: AnyObject {
    func onViewDidLoad()
}

protocol MainInteractorInput: AnyObject {
    func loadData() async -> MainModel
}
