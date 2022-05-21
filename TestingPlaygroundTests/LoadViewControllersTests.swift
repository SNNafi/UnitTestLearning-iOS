@testable import TestingPlayground
import XCTest

final class LoadViewControllersTests: XCTestCase {

//    func test_zero() throws {
//        XCTFail("Tests not yet implemented in LoadViewControllersTests")
//    }
    
    func test_loading() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut: StoryboardBasedViewController = sb.instantiateViewController(identifier: String(describing: StoryboardBasedViewController.self))
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.label)
    }
}
