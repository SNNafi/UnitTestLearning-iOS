@testable import TestingPlayground
import XCTest

private class TestableOverrideViewController: OverrideViewController {
    override func analytics() -> Analytics { Analytics() }
}

final class OverrideViewControllerTests: XCTestCase {

//    func test_zero() throws {
//        XCTFail("Tests not yet implemented in OverrideViewControllerTests")
//    }
    
    func test_viewDidAppear() {
        let sut = MySingletonViewController()
        sut.loadViewIfNeeded()
        sut.viewDidAppear(false)
    }
}
