//
//  StoryParagraphViewModelTests.swift
//  CatNewsTests
//
//  Created by Adam Young on 08/12/2020.
//

@testable import CatNews
import CatNewsCore
import XCTest

class StoryParagraphViewModelTests: XCTestCase {

    func testInitWithParagraph() {
        let paragraph = StoryParagraph(text: "Some paragraph text")

        let viewModel = StoryParagraphViewModel(paragraph: paragraph)

        XCTAssertEqual(viewModel.text, paragraph.text)
    }

}
