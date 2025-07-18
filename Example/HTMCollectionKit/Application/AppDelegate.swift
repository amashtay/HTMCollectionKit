//
//  AppDelegate.swift
//  HTMCollectionKit
//
//  Created by amashtay on 07/08/2025.
//  Copyright (c) 2025 amashtay. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        window.rootViewController = MainModuleBuilder.build().viewController
        window.makeKeyAndVisible()
        
        return true
    }
}

