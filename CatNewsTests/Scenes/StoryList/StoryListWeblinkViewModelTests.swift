//
//  StoryListWeblinkViewModelTests.swift
//  CatNewsTests
//
//  Created by Adam Young on 08/12/2020.
//

@testable import CatNews
import CatNewsCore
import XCTest

class StoryListWeblinkViewModelTests: XCTestCase {

    func testInitWithWeblink() throws {
        let viewModel = StoryListWeblinkViewModel(weblink: mockStoryCollectionWeblink1)

        XCTAssertEqual(viewModel.id, mockStoryCollectionWeblink1.id)
        XCTAssertEqual(viewModel.headline, mockStoryCollectionWeblink1.headline)
        XCTAssertEqual(viewModel.url, mockStoryCollectionWeblink1.weblinkUrl)
        XCTAssertEqual(viewModel.imageURL, mockStoryCollectionWeblink1.teaserImage.links.url.href)
        XCTAssertEqual(viewModel.imageAccessibilityText, mockStoryCollectionWeblink1.teaserImage.accessibilityText)
        XCTAssertEqual(viewModel.publishedDate, mockStoryCollectionWeblink1.creationDate)
    }

}
