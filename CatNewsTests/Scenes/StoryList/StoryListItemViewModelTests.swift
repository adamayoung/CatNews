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
        let item = StoryCollectionItem.story(mockStoryCollectionStory1)
        let expectedResultID = mockStoryCollectionStory1.id

        let viewModel = StoryListItemViewModel(item: item)

        switch viewModel {
        case .story(let result):
            XCTAssertEqual(result.id, expectedResultID)

        default:
            XCTFail("Should have created a story StoryListItemViewModel")
        }
    }

    func testInitWithWeblinkItem() {
        let item = StoryCollectionItem.weblink(mockStoryCollectionWeblink1)
        let expectedResultID = mockStoryCollectionWeblink1.id

        let viewModel = StoryListItemViewModel(item: item)

        switch viewModel {
        case .weblink(let result):
            XCTAssertEqual(result.id, expectedResultID)

        default:
            XCTFail("Should have created a weblink StoryListItemViewModel")
        }
    }

    func testInitWithAdvertItem() {
        let item = StoryCollectionItem.advert(mockStoryCollectionAdvert1)
        let expectedResultURL = mockStoryCollectionAdvert1.url

        let viewModel = StoryListItemViewModel(item: item)

        switch viewModel {
        case .advert(let result):
            XCTAssertEqual(result.url, expectedResultURL)

        default:
            XCTFail("Should have created an advert StoryListItemViewModel")
        }
    }

}
