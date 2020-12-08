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
        let viewModel = StoryListStoryViewModel(story: mockStoryCollectionStory1)

        XCTAssertEqual(viewModel.id, mockStoryCollectionStory1.id)
        XCTAssertEqual(viewModel.headline, mockStoryCollectionStory1.headline)
        XCTAssertEqual(viewModel.teaserText, mockStoryCollectionStory1.teaserText)
        XCTAssertEqual(viewModel.imageURL, mockStoryCollectionStory1.teaserImage.links.url.href)
        XCTAssertEqual(viewModel.imageAccessibilityText, mockStoryCollectionStory1.teaserImage.accessibilityText)
        XCTAssertEqual(viewModel.publishedDate, mockStoryCollectionStory1.creationDate)
    }

}
