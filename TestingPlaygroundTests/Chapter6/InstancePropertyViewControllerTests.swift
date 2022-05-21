@testable import TestingPlayground
import XCTest

final class InstancePropertyViewControllerTests: XCTestCase {

//    func test_zero() throws {
//        XCTFail("Tests not yet implemented in InstancePropertyViewControllerTests")
//    }
    
    func test_viewDidAppear() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut: InstancePropertyViewController = sb.instantiateViewController(identifier: "InstancePropertyViewController")
        sut.analytics = Analytics()
        sut.loadViewIfNeeded()
        
        sut.viewDidAppear(false)
    }
}
