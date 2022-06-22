@testable import TestingPlayground
import XCTest

final class UserDefaultsTests: XCTestCase {
    
    private var sut: UserDefaultsViewController!
    private var defaults: FakeUserDefaults!
    
    override func setUp() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        sut = sb.instantiateViewController(identifier: String(describing: UserDefaultsViewController.self)) as! UserDefaultsViewController
        defaults = FakeUserDefaults()
        sut.userDefaults = defaults
        super.setUp()
    }

    func test_viewDidLoad_withEmptyUserDefaults_shouldShow0InCounterLabel() {
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.counterLabel.text, "0")
    }
    
    func test_viewDidLoad_with7InUserDefaults_shouldShow7InCounterLabel() {
        defaults.integers["count"] = 7
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.counterLabel.text, "7")
    }
    
    func test_tappingButton_with12InUserDefaults_shouldWrite13ToUserDefaults() {
        defaults.integers["count"] = 12
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.counterLabel.text, "12")
        tap(sut.incrementButton)
        XCTAssertEqual(defaults.integers["count"] , 13)
    }
    
    func test_tappingButton_with42InUserDefaults_shouldShow43InCounterLabel() {
        defaults.integers["count"] = 27
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.counterLabel.text, "27")
        tap(sut.incrementButton)
        tap(sut.incrementButton)
        tap(sut.incrementButton)
        XCTAssertEqual(defaults.integers["count"] , 30)
        XCTAssertEqual(sut.counterLabel.text, "30")
    }
    
    override func tearDown() {
        sut = nil
        defaults = nil
        super.tearDown()
    }
}
