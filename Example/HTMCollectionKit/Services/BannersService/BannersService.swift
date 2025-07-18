//
//  BannersService.swift
//  HTMCollectionKit
//
//  Created by amashtayon 10.07.2025.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import Foundation

final class BannersService: BannersServiceProtocol {
    func loadBanners() async -> [Banner] {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        
        return [
            Banner(title: "Lorem", backendColorName: "red"),
            Banner(title: "Ipsum", backendColorName: "orange"),
            Banner(title: "Dolor", backendColorName: "yellow"),
            Banner(title: "Sit", backendColorName: "green"),
            Banner(title: "Amet", backendColorName: "cyan"),
            Banner(title: "Consectetur", backendColorName: "blue"),
            Banner(title: "Adipiscing", backendColorName: "magenta")
        ]
    }
}
