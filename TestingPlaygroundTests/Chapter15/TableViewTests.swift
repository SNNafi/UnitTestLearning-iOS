@testable import TestingPlayground
import XCTest

final class TableViewTests: XCTestCase {

    var sut: TableViewController!
    
    override func setUp() {
        super.setUp()
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        sut = sb.instantiateViewController(identifier: String(describing: TableViewController.self))
        sut.loadViewIfNeeded()
    }
    
    
    func test_tableViewDelegates_shouldBeConnected() {
        XCTAssertNotNil(sut.tableView.delegate)
        XCTAssertNotNil(sut.tableView.dataSource)
    }
    
    func test_numberOfRows_shouldBe3() {
        XCTAssertEqual(numberOfRows(in: sut.tableView), 3)
    }
    
    func test_cellForRowAt_withRow0_shouldSetCellLabelToOne() {
        let cell = cellForRow(in: sut.tableView, row: 0, section: 0)
        XCTAssertEqual(cell?.textLabel?.text, "One")
    }
    
    func test_cellForRowAt_withRow0_shouldSetCellLabelToTwo() {
        let cell = cellForRow(in: sut.tableView, row: 1, section: 0)
        XCTAssertEqual(cell?.textLabel?.text, "Two")
    }
    
    func test_cellForRowAt_withRow0_shouldSetCellLabelToThree() {
        let cell = cellForRow(in: sut.tableView, row: 2, section: 0)
        XCTAssertEqual(cell?.textLabel?.text, "Three")
    }
    
    func test_didSelectRow_withRow1() {
        didSelectRow(in: sut.tableView, row: 1)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
}
