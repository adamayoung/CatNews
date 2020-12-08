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
    }

}
