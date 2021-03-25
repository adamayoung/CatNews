//
//  StoryListItemViewModelTests.swift
//  CatNewsTests
//
//  Created by Adam Young on 08/12/2020.
//

@testable import CatNews
import CatNewsCore
import XCTest

class StoryListItemViewModelTests: XCTestCase {

    func testInitWithStoryItem() {
        let story = StoryCollectionStory.mock1
        let item = StoryCollectionItem.story(story)
        let expectedResultID = story.id

        let viewModel = StoryListItemViewModel(item: item)

        switch viewModel {
        case .story(let result):
            XCTAssertEqual(result.id, expectedResultID)

        default:
            XCTFail("Should have created a story StoryListItemViewModel")
        }
    }

    func testInitWithWeblinkItem() {
        let weblink = StoryCollectionWeblink.mock
        let item = StoryCollectionItem.weblink(weblink)
        let expectedResultID = weblink.id

        let viewModel = StoryListItemViewModel(item: item)

        switch viewModel {
        case .weblink(let result):
            XCTAssertEqual(result.id, expectedResultID)

        default:
            XCTFail("Should have created a weblink StoryListItemViewModel")
        }
    }

    func testInitWithAdvertItem() {
        let advert = StoryCollectionAdvert.mock
        let item = StoryCollectionItem.advert(advert)
        let expectedResultURL = advert.url

        let viewModel = StoryListItemViewModel(item: item)

        switch viewModel {
        case .advert(let result):
            XCTAssertEqual(result.url, expectedResultURL)

        default:
            XCTFail("Should have created an advert StoryListItemViewModel")
        }
    }

}
