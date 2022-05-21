@testable import TestingPlayground
import XCTest

final class XIBBasedViewControllerTests: XCTestCase {

//    func test_zero() throws {
//        XCTFail("Tests not yet implemented in XIBBasedViewControllerTests")
//    }
    
//    The designated initializer of UIViewController is init(nibName:bundle:). So why am I not calling this in the test? How is this even working?
//    Initializing a UIViewController without arguments calls through to the designated initializer, passing nil arguments. Since our view controller class name XIBBasedView- Controller ends with Controller, UIKit will first look for a XIB file named XIBBasedView. (More accurately, it will look for a NIB file created from a XIB file with that name.) If that doesn’t work, it will try to look for a XIB that matches the full name XIBBasedViewController.
    
    func test_load() {
        let sut = XIBBasedViewController()
        sut.loadViewIfNeeded()
        XCTAssertEqual("SNNAFI", sut.label.text)
    }
}
