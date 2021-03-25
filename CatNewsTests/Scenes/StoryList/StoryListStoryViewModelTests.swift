//
//  StoryListStoryViewModelTests.swift
//  CatNewsTests
//
//  Created by Adam Young on 08/12/2020.
//

@testable import CatNews
import CatNewsCore
import XCTest

class StoryListStoryViewModelTests: XCTestCase {

    func testInitWithStory() throws {
        let story = StoryCollectionStory.mock1
        let viewModel = StoryListStoryViewModel(story: story)

        XCTAssertEqual(viewModel.id, story.id)
        XCTAssertEqual(viewModel.headline, story.headline)
        XCTAssertEqual(viewModel.teaserText, story.teaserText)
        XCTAssertEqual(viewModel.imageURL, story.teaserImage.links.url.href)
        XCTAssertEqual(viewModel.imageAccessibilityText, story.teaserImage.accessibilityText)
        XCTAssertEqual(viewModel.publishedDate, story.creationDate)
    }

}
