@testable import TestingPlayground
import XCTest
import ViewControllerPresentationSpy

final class PushViewControllerTest: XCTestCase {
    
    let presentationVerifier = PresentationVerifier()
    var sut: NavPushViewController!
    
    
    override func setUp() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        sut = sb.instantiateViewController(identifier: String(describing: NavPushViewController.self)) as! NavPushViewController
        sut.loadViewIfNeeded()
        super.setUp()
    }
    
    func test_tappingCodePushButton_shouldPushCodeNextViewController() {
        
        let navigationController = UINavigationController(rootViewController: sut)
        
        XCTAssertNotNil(sut.codePushButton)
        // tap(sut.codePushButton)
        sut.pushNextViewController()
        
        executeRunLoop()
        XCTAssertEqual(navigationController.viewControllers.count, 2)
        
        let pushedVC = navigationController.viewControllers.last
        guard let codeNextVC = pushedVC as? CodeNextViewController else {
            XCTFail("Expected CodeNextViewController, "
                    + "but was \(String(describing: pushedVC))")
            return
        }
        executeRunLoop()
        XCTAssertEqual(codeNextVC.label.text, "Pushed from code")
    }
    
    func test_INCORRECT_tappingCodeModalButton_shouldPresentCodeNextViewController() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        sut = sb.instantiateViewController(identifier: String(describing: NavPushViewController.self)) as! NavPushViewController
        sut.loadViewIfNeeded()
        
        UIApplication.shared.windows.first?.rootViewController = sut
        
        sut.presentModalNextViewController()
        executeRunLoop()
        
        let codeNextVC: CodeNextViewController? = presentationVerifier.verify(animated: true, presentingViewController: sut)
        XCTAssertEqual(codeNextVC?.label.text, "Modal from code")
    }
    
    func test_tappingSeguePushButton_shouldShowSegueNextViewController() {
        putInWindow(sut)
        tap(sut.seguePushButton)
        executeRunLoop()
        XCTAssertNotNil(sut.seguePushButton, "seguePushButton")
        let segueNextVC: SegueNextViewController? = presentationVerifier.verify( animated: true, presentingViewController: sut)
        executeRunLoop()
        XCTAssertEqual(segueNextVC?.labelText, "Pushed from segue")
    }
    
    override func tearDown() {
        executeRunLoop()
        sut = nil
        super.tearDown()
    }
}
