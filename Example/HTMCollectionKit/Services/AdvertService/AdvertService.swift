//
//  AdvertService.swift
//  HTMCollectionKit
//
//  Created by amashtayon 09.07.2025.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import Foundation

final class AdvertService: AdvertServiceProtocol {
    func loadCurrentAdvert() async -> Advert {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        
        return Advert(
            advertId: UUID().uuidString,
            backendColorName: "blue",
            title: "Lorem Ipsum, 2025",
            price: "50 000 $",
            description:
            """
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
            Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
            Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
            Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
            Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
            """
        )
    }
}
