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
        let advert = StoryCollectionAdvert.mock
        let viewModel = StoryListAdvertViewModel(advert: advert)

        XCTAssertEqual(viewModel.url, advert.url)
    }

}
