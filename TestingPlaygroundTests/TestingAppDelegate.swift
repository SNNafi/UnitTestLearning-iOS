//
//  TestingAppDelegate.swift
//  TestingPlaygroundTests
//
//  Created by Shahriar Nasim Nafi on 21/5/22.
//

import UIKit

@objc(TestingAppDelegate)
class TestingAppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print(">> Launching with testing app delegate")
        return true
    }

}

