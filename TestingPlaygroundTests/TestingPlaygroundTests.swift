//
//  TestingPlaygroundTests.swift
//  TestingPlaygroundTests
//
//  Created by Shahriar Nasim Nafi on 14/5/22.
//

import XCTest
@testable import TestingPlayground

class TestingPlaygroundTests: XCTestCase {

    func test_fail() {
        XCTFail()
    }
    
    func test_fail_WithSimpleMessage() {
        XCTFail("We have a problem")
    }
    
    func test_fail_withInterpolatedMessage() {
        let answer = 42;
        XCTFail("The wrong answer is \(answer)")
    }
    
    func test_avoidConditionalCode() {
        let success = false
        if !success {
            XCTFail()
        }
    }
    
    func test_assertTrue() {
        let success = false
        XCTAssertTrue(success)
    }
    
    func test_assertNil() {
        let optional: Int? = 14
        XCTAssertNil(optional)
    }

    // That’s the way XCTest reports strings, and assertions ask objects to describe themselves as strings
    
    func test_assertNil_withSimpleStruct() {
        let optional: TestCase? = TestCase(x: 0, y: 0)
        XCTAssertNil(optional)
    }
    
    func test_assertNil_withSelfDescribingType() {
        let optional: TestCaseWithDescription? = TestCaseWithDescription(x: 0, y: 0)
        XCTAssertNil(optional)
    }
    
    func test_asseetEqual() {
        let actual = "actual"
        XCTAssertEqual(actual, "expected")
    }
    
    // Well, XCTAssertEqual() requires both arguments to be the same type. Swift knows that if a value of type T is being assigned to a variable of type T?, it can wrap it. This promotes the value from non-optional to optional
    func test_assertEqual_withOptional() {
        let foo: String? = "foo"
        XCTAssertEqual(foo, "bar")
    }
    
    func test_floatingPointDanger() {
        let result = 0.1 + 0.2
        XCTAssertEqual(result, 0.3)
    }
    
    func test_isFloatingPointDanger() {
        let result = 0.1 + 0.4
        XCTAssertEqual(result, 0.5)
    }
    
    func test_floatingPointFixed() {
        let result = 0.1 + 0.2
        XCTAssertEqual(result, 0.3, accuracy: 0.0001)
    }

    
    func test_messageOverkill() {
        let actual = "actual"
        XCTAssertEqual(actual, "expected", "Expected \"expected\" but got \(actual)")
    }
}

struct TestCase {
    let x: Int
    let y: Int
}


struct TestCaseWithDescription {
    let x: Int
    let y: Int
}

extension TestCaseWithDescription: CustomStringConvertible {
    var description: String { "X: \(x) Y: \(y)" }
}
