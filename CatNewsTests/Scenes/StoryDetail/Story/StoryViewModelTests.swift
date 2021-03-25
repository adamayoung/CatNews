//
//  StoryViewModelTests.swift
//  CatNewsTests
//
//  Created by Adam Young on 08/12/2020.
//

@testable import CatNews
import CatNewsCore
import XCTest

class StoryViewModelTests: XCTestCase {

    func testInitWithStory() {
        let story = Story.mock1
        let viewModel = StoryViewModel(story: story)

        XCTAssertEqual(viewModel.id, story.id)
        XCTAssertEqual(viewModel.headline, story.headline)
        XCTAssertEqual(viewModel.heroImageURL, story.heroImage.imageUrl)
        XCTAssertEqual(viewModel.heroImageAccessibilityText, story.heroImage.accessibilityText)
        XCTAssertEqual(viewModel.creationDate, story.creationDate)
        XCTAssertEqual(viewModel.modifiedDate, story.modifiedDate)
        XCTAssertEqual(viewModel.contents.count, story.contents.count)
    }

}
