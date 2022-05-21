@testable import TestingPlayground
import XCTest

final class InstanceInitializerViewControllerTests: XCTestCase {

//    func test_zero() throws {
//        XCTFail("Tests not yet implemented in InstanceInitializerViewControllerTests")
//    }
    
    func test_viewDidAppear() {
        let sut = InstanceInitializerViewController(analytics: Analytics())
        sut.loadViewIfNeeded()
        sut.viewDidAppear(false)
    }
}
