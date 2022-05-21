@testable import TestingPlayground
import XCTest

final class MySingletonViewControllerTests: XCTestCase {

//    func test_zero() throws {
//        XCTFail("Tests not yet implemented in MySingletonViewControllerTests")
//    }
    
    override func setUp() {
        super.setUp()
        MySingletonAnalytics.stubbedInstance = MySingletonAnalytics()
    }
    
    override func tearDown() {
        MySingletonAnalytics.stubbedInstance = nil
        super.tearDown()
    }
    
    func test_viewDidAppear() {
        let sut = MySingletonViewController()
        sut.loadViewIfNeeded()
        sut.viewDidAppear(false)
    }
}
