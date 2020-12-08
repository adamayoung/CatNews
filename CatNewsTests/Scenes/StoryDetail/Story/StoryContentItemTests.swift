//
//  StoryContentItemTests.swift
//  CatNewsTests
//
//  Created by Adam Young on 08/12/2020.
//

@testable import CatNews
import CatNewsCore
import XCTest

class StoryContentItemTests: XCTestCase {

    func testInitWithParagraphContent() {
        let content = StoryContent.paragraph(mockParagraph1)

        let item = StoryContentItem(content: content)

        switch item {
        case .paragraph(let result):
            XCTAssertEqual(result.text, mockParagraph1.text)

        default:
            XCTFail("Should have created a paragraph StoryContentItem")
        }
    }

    func testInitWithImageContent() {
        let content = StoryContent.image(mockImage1)

        let item = StoryContentItem(content: content)

        switch item {
        case .image(let result):
            XCTAssertEqual(result.url, mockImage1.url)
            XCTAssertEqual(result.accessibilityText, mockImage1.accessibilityText)

        default:
            XCTFail("Should have created an image StoryContentItem")
        }
    }

}
