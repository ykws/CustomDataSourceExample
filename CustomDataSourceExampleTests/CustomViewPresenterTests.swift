//
//  CustomViewPresenterTests.swift
//  CustomDataSourceExampleTests
//
//  Created by KAWASHIMA Yoshiyuki on 2021/05/15.
//

import XCTest
@testable import CustomDataSourceExample

class CustomViewPresenterTests: XCTestCase {

    var stubOutput: StubCustomViewPresenterOutput!
    var presenter: CustomViewPresenter!

    override func setUpWithError() throws {
        stubOutput = StubCustomViewPresenterOutput()
        presenter = CustomViewPresenter(view: stubOutput)
    }

    func test_success_didSelectUpButton() throws {
        presenter.count = 0

        presenter.didSelectUpButton()
        XCTAssertEqual(presenter.count, 1)
    }

    func test_success_didSelectDownButton() throws {
        presenter.count = 1

        presenter.didSelectDownButton()
        XCTAssertEqual(presenter.count, 0)
    }

    func test_failure_didSelectUpButton() throws {
        presenter.count = 9

        presenter.didSelectUpButton()
        XCTAssertEqual(presenter.count, 9)
    }

    func test_failure_didSelectDownButton() throws {
        presenter.count = 0

        presenter.didSelectDownButton()
        XCTAssertEqual(presenter.count, 0)
    }

}

final class StubCustomViewPresenterOutput: CustomViewPresenterOutput {
    var count: Int = 0
    
    func updateCount(_ count: Int) {
        self.count = count
    }

}
