@testable import TestingPlayground
import XCTest

final class CoveredClassTests: XCTestCase {

//    func test_zero() throws {
//        XCTFail("Tests not yet implemented in CoveredClassTests")
//    }
    
//    A good test name has three parts:
//    1. What the test is exercising. This is usually a function name.
//    2. The conditions of the test. What are the inputs that make a difference?
//    3. The expected result.
    
    func test_max_with1And2_shouldReturn2() {
        let result = CoveredClass.max(1, 2)
        XCTAssertEqual(result, 2)
    }
    
    func test_max_with3And2_shouldReturn3() {
        let result = CoveredClass.max(3, 2)
        XCTAssertEqual(result, 3)
    }
    
    func test_commaSeparated_from2to4_shouldReturn234WithCommaAndSpaceBetweenThem() {
        let result = CoveredClass.commaSeparated(from: 2, to: 4)
        XCTAssertEqual(result, "2, 3, 4")
    }
    
    func test_commaSeparated_from2to2_shouldReturn2WithNoComma() {
        let result = CoveredClass.commaSeparated(from: 2, to: 2)
        XCTAssertEqual(result, "2")
    }
    
    func test_area_withWidth7_shouldBeSomething() {
        let sut = CoveredClass()
        sut.width = 7
        XCTAssertEqual(sut.area, 49)
    }
}
