//
//  MyClass.swift
//  TestingPlayground
//
//  Created by Shahriar Nasim Nafi on 21/5/22.
//

import Foundation

class MyClass {
    
    private static var allInstances = 0
    private let instance: Int
    
    init() {
        Self.allInstances += 1
        instance = Self.allInstances
        print(">> MyClass.init() #\(instance)")
    }
    
    deinit {
        print(">> MyClass.deinit #\(instance)")
    }
    
    func methodOne() {
        print(">> methodOne")
    }
    
    func methodTwo() {
        print(">> methodTwo")
    }
}
