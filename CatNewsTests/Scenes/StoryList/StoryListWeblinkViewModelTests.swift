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
        let weblink = StoryCollectionWeblink.mock
        let viewModel = StoryListWeblinkViewModel(weblink: weblink)

        XCTAssertEqual(viewModel.id, weblink.id)
        XCTAssertEqual(viewModel.headline, weblink.headline)
        XCTAssertEqual(viewModel.url, weblink.weblinkUrl)
        XCTAssertEqual(viewModel.imageURL, weblink.teaserImage.links.url.href)
        XCTAssertEqual(viewModel.imageAccessibilityText, weblink.teaserImage.accessibilityText)
        XCTAssertEqual(viewModel.publishedDate, weblink.creationDate)
    }

}
