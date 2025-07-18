//
//  MainViewDataFactoryProtocol.swift
//  HTMCollectionKit
//
//  Created by amashtayon 08.07.2025.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import UIKit

protocol MainViewDataFactoryProtocol: AnyObject {
    func createViewData(
        model: MainModel,
        onItemTouched: ((MainSelection) -> Void)?
    ) -> MainViewData
}
