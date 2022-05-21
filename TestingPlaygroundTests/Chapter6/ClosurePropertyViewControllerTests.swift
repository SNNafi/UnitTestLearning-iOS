@testable import TestingPlayground
import XCTest

final class ClosurePropertyViewControllerTests: XCTestCase {

//    func test_zero() throws {
//        XCTFail("Tests not yet implemented in ClosurePropertyViewControllerTests")
//    }
    
    func test_viewDidAppear() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut: ClosurePropertyViewController = sb.instantiateViewController(identifier: "ClosurePropertyViewController")
        sut.loadViewIfNeeded()
        sut.makeAnalytics = { Analytics() }
        sut.loadViewIfNeeded()
        
        sut.viewDidAppear(false)
    }
}
