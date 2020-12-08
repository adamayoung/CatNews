//
//  StoryDetailViewModelTests.swift
//  CatNewsTests
//
//  Created by Adam Young on 08/12/2020.
//

@testable import CatNews
import CatNewsCore
import XCTest

class StoryDetailViewModelTests: XCTestCase {

    var viewModel: StoryDetailViewModel!
    var storyID: String!
    var newsStore: MockNewsStore!

    override func setUpWithError() throws {
        storyID = UUID().uuidString
        newsStore = MockNewsStore()
        viewModel = StoryDetailViewModel(storyID: storyID, newsStore: newsStore)
    }

    override func tearDownWithError() throws {
        storyID = nil
        newsStore = nil
        viewModel = nil
    }

    func testInitSetsStoryID() {
        XCTAssertEqual(viewModel.storyID, storyID)
    }

    func testFetchWHenFetchSuccessSetStory() {
        newsStore.fetchStoryResult = .success(mockStory)

        let expectation = XCTestExpectation(description: "viewModel.fetch")
        viewModel.fetch {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)

        XCTAssertEqual(newsStore.fetchStoreLastID, storyID)
        XCTAssertNil(viewModel.fetchError)
        XCTAssertNotNil(viewModel.story)
    }

    func testFetchWhenFetchNotFoundSetsFetchError() {
        newsStore.fetchStoryResult = .success(nil)

        let expectation = XCTestExpectation(description: "viewModel.fetch")
        XCTAssertNil(viewModel.fetchError)
        viewModel.fetch {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)

        XCTAssertNil(viewModel.story)
        XCTAssertTrue(viewModel.fetchError is StoryDetailViewModel.StoryNotFoundError)
    }

    func testFetchWhenFetchFailsSetsFetchError() {
        let expectedError = MockFetchError()
        newsStore.fetchStoryResult = .failure(expectedError)

        let expectation = XCTestExpectation(description: "viewModel.fetch")
        XCTAssertNil(viewModel.fetchError)
        viewModel.fetch {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)

        guard let fetchError = viewModel.fetchError as? MockFetchError else {
            XCTFail("ViewModel contains no fetchError")
            return
        }

        XCTAssertTrue(fetchError === expectedError)
    }

}
