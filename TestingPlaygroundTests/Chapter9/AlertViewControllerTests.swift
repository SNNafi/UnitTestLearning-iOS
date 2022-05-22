@testable import TestingPlayground
import XCTest
import ViewControllerPresentationSpy

final class AlertViewControllerTests: XCTestCase {

//    func test_zero() throws {
//        XCTFail("Tests not yet implemented in AlertViewControllerTests")
//    }
    
    private var sut: AlertViewController!
    private var alertVerifier: AlertVerifier!
    
    override func setUp() {
        super.setUp()
        alertVerifier = AlertVerifier()
        let sb = UIStoryboard(name: "Main", bundle: nil)
        sut = sb.instantiateViewController(identifier: String(describing: AlertViewController.self))
        sut.loadViewIfNeeded()
        
    }
    
    override func tearDown() {
        alertVerifier = nil
        sut = nil
        super.tearDown()
    }
    
    func test_tappingButton_shouldShowAlert() {
        tap(sut.button)
        alertVerifier.verify(title: "Do the Thing?",
                             message: "Let us know if you want to do the thing.",
                             animated: true,
                             actions: [.cancel("Cancel"), .default("Tap")],
                             presentingViewController: sut)
       
        
        XCTAssertEqual(alertVerifier.preferredAction?.title, "Tap", "preferred action")
    }
    
    func test_executeAlertAction_withOKButton() throws {
        tap(sut.button)
        try alertVerifier.executeAction(forButton: "Tap")
    }
}
