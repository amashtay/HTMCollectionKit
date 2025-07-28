//
//  AdvertServiceProtocol.swift
//  HTMCollectionKit
//
//  Created by amashtay on 09.07.2025.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import Foundation

protocol AdvertServiceProtocol: AnyObject {
    func loadCurrentAdvert() async -> Advert
}
