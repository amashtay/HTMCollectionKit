//
//  MainModuleIO.swift
//  HTMCollectionKit
//
//  Created by amashtayon 08.07.2025.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import UIKit

typealias MainModule = Module<MainModuleIO>

protocol MainModuleIO: AnyObject {
    var onFinish: (() -> Void)? { get set }
}
