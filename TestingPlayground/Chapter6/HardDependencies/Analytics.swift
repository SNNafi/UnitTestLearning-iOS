//
//  Analytics.swift
//  TestingPlayground
//
//  Created by Shahriar Nasim Nafi on 21/5/22.
//

import Foundation

class Analytics {
    static let shared = Analytics()
    
    func track(event: String) {
        print("> \(event)")
        
        if self !== Self.shared {
            print(">> ...Not the Analytics singleton")
        }
    }
}
