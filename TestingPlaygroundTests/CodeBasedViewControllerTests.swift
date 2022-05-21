@testable import TestingPlayground
import XCTest

final class CodeBasedViewControllerTests: XCTestCase {

//    func test_zero() throws {
//        XCTFail("Tests not yet implemented in CodeBasedViewControllerTests")
//    }
    
    // Clearly communicate to your readers which arguments are dummy arguments. For a string, this can be done by setting the value to "DUMMY" or "". For numbers, 0 is often clear enough. For other types, extract a variable and give it a name starting with dummy
    
    func test_load() {
        let sut = CodeBasedViewController(data: "SNNAFI")
        sut.loadViewIfNeeded()
        XCTAssertEqual("SNNAFI", sut.label.text)
    }
}
