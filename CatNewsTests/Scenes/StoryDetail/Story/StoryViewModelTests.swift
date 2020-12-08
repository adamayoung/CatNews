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
        let viewModel = StoryViewModel(story: mockStory)

        XCTAssertEqual(viewModel.id, mockStory.id)
        XCTAssertEqual(viewModel.headline, mockStory.headline)
        XCTAssertEqual(viewModel.heroImageURL, mockStory.heroImage.imageUrl)
        XCTAssertEqual(viewModel.heroImageAccessibilityText, mockStory.heroImage.accessibilityText)
        XCTAssertEqual(viewModel.creationDate, mockStory.creationDate)
        XCTAssertEqual(viewModel.modifiedDate, mockStory.modifiedDate)
        XCTAssertEqual(viewModel.contents.count, mockStory.contents.count)
    }

}
