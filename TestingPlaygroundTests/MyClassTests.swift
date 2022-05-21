//
//  MyClassTests.swift
//  TestingPlaygroundTests
//
//  Created by Shahriar Nasim Nafi on 21/5/22.
//

import XCTest
@testable import TestingPlayground

class MyClassTests: XCTestCase {

    private var sut: MyClass!
    
//    func test_Zero() {
//        XCTFail("Tests not yet implemented in MyClassTests")
//    }
    
    override func setUp() {
        super.setUp()
        sut = MyClass()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_methodOne() {
        // The name sut stands for system under test
        // let sut = MyClass()
        sut.methodOne()
        
    }
    
    func test_methodTwo() {
        // The name sut stands for system under test
      //  let sut = MyClass()
        sut.methodTwo()
    }
}
