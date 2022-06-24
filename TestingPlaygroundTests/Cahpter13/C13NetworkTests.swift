@testable import TestingPlayground
import XCTest
import ViewControllerPresentationSpy

// ContractTest


final class C13NetworkTests: XCTestCase {
    
    var sut: C13NetworkTestViewController!
    var spyURLSession: SpyURLSession!
    private var alertVerifier: AlertVerifier!
    
    override func setUp() {
        super.setUp()
        alertVerifier = AlertVerifier()
        let sb = UIStoryboard(name: "Main", bundle: nil)
        sut = sb.instantiateViewController(identifier: String(describing: C13NetworkTestViewController.self))
        spyURLSession = SpyURLSession()
        sut.session = spyURLSession
        
    }
    
    func test_searchForBookNetworkCall_withSuccessResponse_shouldSaveDataInResults() {
        sut.loadViewIfNeeded()
        tap(sut.button)
        
        let handleResultsCalled = expectation(description: "handleResults called")
        sut.handleResults = { results in
            handleResultsCalled.fulfill()
        }
        
        spyURLSession.dataTaskArgsCompletionHandler.first?(jsonData(), response(statusCode: 200), nil)
        
        waitForExpectations(timeout: 0.01)
        
        XCTAssertEqual(sut.results, [
            SearchResult(artistName: "Artist", trackName: "Track",
                         averageUserRating: 2.5, genres: ["Foo", "Bar"])
        ])
        
    }
    
    func test_searchForBookNetworkCall_withSuccessBeforeAsync_shouldNotSaveDataInResults() {
        sut.loadViewIfNeeded()
        tap(sut.button)
        
        spyURLSession.dataTaskArgsCompletionHandler.first?(jsonData(), response(statusCode: 200), nil)
        
        XCTAssertEqual(sut.results, [])
    }
    
    func test_searchForBookNetworkCall_withError_shouldShowAlert() {
        sut.loadViewIfNeeded()
        tap(sut.button)
        let alertShown = expectation(description: "alert shown")
        alertVerifier.testCompletion = {
            alertShown.fulfill()
        }
        
        spyURLSession.dataTaskArgsCompletionHandler.first?(nil, nil, TestError(message: "oh no!"))
        
        waitForExpectations(timeout: 0.01)
        verifyErrorAlert(message: "oh no!")
        
    }
    
    func test_searchForBookNetworkCall_withIncompleteData_shouldShowAlert() {
        sut.loadViewIfNeeded()
        tap(sut.button)
        let alertShown = expectation(description: "alert shown")
        alertVerifier.testCompletion = {
            alertShown.fulfill()
        }
        
        spyURLSession.dataTaskArgsCompletionHandler.first?(jsonDataIncomplete(), response(statusCode: 200), nil)
        
        waitForExpectations(timeout: 0.01)
       
        XCTAssertEqual(alertVerifier.presentedCount, 1)
        
    }
    
    func test_searchForBookNetworkCall_withStatusCodeOtherThan200_shouldShowAlert() {
        sut.loadViewIfNeeded()
        tap(sut.button)
        let alertShown = expectation(description: "alert shown")
        alertVerifier.testCompletion = {
            alertShown.fulfill()
        }
        
        spyURLSession.dataTaskArgsCompletionHandler.first?(jsonData(), response(statusCode: 1400), nil)
        
        waitForExpectations(timeout: 0.01)
       
        XCTAssertEqual(alertVerifier.presentedCount, 1)
        
    }
    
    func test_searchForBookNetworkCall_withErrorPreAsync_shouldNotShowAlert() {
        sut.loadViewIfNeeded()
        tap(sut.button)
        
        spyURLSession.dataTaskArgsCompletionHandler.first?(nil, nil, TestError(message: "oh no!"))
        
        XCTAssertEqual(alertVerifier.presentedCount, 0)
    }
    
    func test_buttonIsDisableWhileCall_ShouldEnableAfterFinish() {
        sut.loadViewIfNeeded()
        tap(sut.button)
        
        let buttonDisable = expectation(description: "button disable")
        
        sut.handleResults = { _ in
            buttonDisable.fulfill()
        }
        
        XCTAssertFalse(sut.button.isEnabled)
        
        spyURLSession.dataTaskArgsCompletionHandler.first?(jsonData(), response(statusCode: 200), nil)
        
        waitForExpectations(timeout: 0.01)
        
        XCTAssertTrue(sut.button.isEnabled)
    }
    
    override func tearDown() {
        alertVerifier = nil
        sut = nil
        spyURLSession = nil
        super.tearDown()
    }
    
    private func jsonData() -> Data {
        """
        {
            "results": [
                {
                    "artistName": "Artist",
                    "trackName": "Track",
                    "averageUserRating": 2.5,
                    "genres": [
                        "Foo",
                        "Bar"
                       ]
                }
            ]
        
        }
        """
            .data(using: .utf8)!
    }
    
    private func jsonDataIncomplete() -> Data {
        """
        {
            "results": [
                {
                    "artistName": "Artist",
                    "trackName": "Track",
                    "averageUserRating": 2.5,
                    "genres":
                        "Foo",
                        "Bar"
                       ]
                }
            ]
        
        }
        """
            .data(using: .utf8)!
    }
    
    private func response(statusCode: Int) -> HTTPURLResponse? {
        HTTPURLResponse(url: URL(string: "http://DUMMY")!,
                        statusCode: statusCode, httpVersion: nil, headerFields: nil)
    }
    
    private func verifyErrorAlert(
        message: String, file: StaticString = #file, line: UInt = #line) {
            alertVerifier.verify(
                title: "Network problem",
                message: message, animated: true, actions: [
                    .default("OK"), ],
                presentingViewController: sut,
                file: file,
                line: line
            )
            XCTAssertEqual(alertVerifier.preferredAction?.title, "OK",
                           "preferred action", file: file, line: line)
        }
    
    
}
