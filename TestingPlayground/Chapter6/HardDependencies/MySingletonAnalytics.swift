//
//  MySingletonAnalytics.swift
//  TestingPlayground
//
//  Created by Shahriar Nasim Nafi on 21/5/22.
//
//


// Dependency Injection Principles, Practices, and Patterns [vS19] describes the singleton backdoor as an anti-pattern called Ambient Context

import Foundation

class MySingletonAnalytics {
    
    private static let instance = MySingletonAnalytics()
    
#if DEBUG
    static var stubbedInstance: MySingletonAnalytics?
#endif
    
    static var shared: MySingletonAnalytics {
#if DEBUG
        if let stubbedInstance = stubbedInstance {
            return stubbedInstance
        }
#endif
        return instance
    }
    
    func track(event: String) {
        Analytics.shared.track(event: event)
        
        if self !== Self.instance {
            print(">> Not the MySingletonAnalytics singleton")
        }
    }
}
