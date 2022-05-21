@testable import TestingPlayground
import XCTest

final class ClosureInitializerViewControllerTests: XCTestCase {

//    func test_zero() throws {
//        XCTFail("Tests not yet implemented in ClosureInitializerViewControllerTests")
//    }
    
    func test_viewDidAppear() {
        let sut = ClosureInitializerViewController(makeAnalytics: { Analytics() })
        sut.loadViewIfNeeded()
        sut.viewDidAppear(false)
    }
}
