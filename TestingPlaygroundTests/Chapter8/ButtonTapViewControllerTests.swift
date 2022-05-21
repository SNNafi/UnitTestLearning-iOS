@testable import TestingPlayground
import XCTest

final class ButtonTapViewControllerTests: XCTestCase {

//    func test_zero() throws {
//        XCTFail("Tests not yet implemented in ButtonTapViewControllerTests")
//    }
    
    func test_tappingButton() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut: ButtonTapViewController = sb.instantiateViewController(identifier: "ButtonTapViewController")
        sut.loadViewIfNeeded()
        
        tap(sut.button)
    }
    
}
