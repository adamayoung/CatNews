//
//  DateformatterExtensionsTests.swift
//  CatNewsTests
//
//  Created by Adam Young on 08/12/2020.
//

@testable import CatNews
import XCTest

class DateformatterExtensionsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFullDateDateFormatterReturnsDateFormatter() {
        let dateFormatter = DateFormatter.fullDate
        dateFormatter.locale = Locale(identifier: "en_GB")
        let date = Date(timeIntervalSince1970: 1607452233)
        let expectedResult = "Tuesday, 8 December 2020 at 18:30:33"

        let result = dateFormatter.string(from: date)

        XCTAssertEqual(result, expectedResult)
    }

    func testNamedRelativeDateTimeFormatterReturnsRelativeDateTimeFormatter() {
        let dateFormatter = RelativeDateTimeFormatter.named
        dateFormatter.locale = Locale(identifier: "en_GB")
        let date = Date(timeIntervalSince1970: 1607452233)
        let relativeDate = Date(timeIntervalSince1970: 1607455233)

        let expectedResult = "50 min ago"

        let result = dateFormatter.localizedString(for: date, relativeTo: relativeDate)

        XCTAssertEqual(result, expectedResult)
    }

}
