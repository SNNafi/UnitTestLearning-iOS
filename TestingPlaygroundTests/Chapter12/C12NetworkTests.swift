@testable import TestingPlayground
import XCTest

final class C12NetworkTests: XCTestCase {
    
    var sut: NetworkTestViewController!
    var mockURLSession: MockURLSession!
    
    override func setUp() {
        super.setUp()
        let sb = UIStoryboard(name: "Main", bundle: nil)
        sut = sb.instantiateViewController(identifier: String(describing: NetworkTestViewController.self))
        mockURLSession = MockURLSession()
        
    }
    
    func test_NetworkRequestCallCount1() {
        sut.session = mockURLSession
        sut.loadViewIfNeeded()
        tap(sut.button)
        mockURLSession.verifyDataTask(with: URLRequest(url: URL(string: "https://itunes.apple.com/search?media=ebook&term=out%20from%20boneville")!))
    }

    override func tearDown() {
        sut = nil
        mockURLSession = nil
        super.tearDown()
    }
}
