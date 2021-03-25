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
        let paragraph = StoryParagraph.mock1
        let content = StoryContent.paragraph(paragraph)

        let item = StoryContentItem(content: content)

        switch item {
        case .paragraph(let result):
            XCTAssertEqual(result.text, paragraph.text)

        default:
            XCTFail("Should have created a paragraph StoryContentItem")
        }
    }

    func testInitWithImageContent() {
        let image = StoryImage.mock1
        let content = StoryContent.image(image)

        let item = StoryContentItem(content: content)

        switch item {
        case .image(let result):
            XCTAssertEqual(result.url, image.url)
            XCTAssertEqual(result.accessibilityText, image.accessibilityText)

        default:
            XCTFail("Should have created an image StoryContentItem")
        }
    }

}
