//
//  StoryListAdvertViewModelTests.swift
//  CatNewsTests
//
//  Created by Adam Young on 08/12/2020.
//

@testable import CatNews
import CatNewsCore
import XCTest

class StoryListAdvertViewModelTests: XCTestCase {

    func testInitWithAdvert() throws {
        let viewModel = StoryListAdvertViewModel(advert: mockStoryCollectionAdvert1)

        XCTAssertEqual(viewModel.url, mockStoryCollectionAdvert1.url)
    }

}
