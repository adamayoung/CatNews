//
//  StoryListViewModelTests.swift
//  CatNewsTests
//
//  Created by Adam Young on 08/12/2020.
//

@testable import CatNews
import CatNewsCore
import XCTest

class StoryListViewModelTests: XCTestCase {

    var viewModel: StoryListViewModel!
    var newsStore: MockNewsStore!

    override func setUpWithError() throws {
        newsStore = MockNewsStore()
        viewModel = StoryListViewModel(newsStore: newsStore)
    }

    override func tearDownWithError() throws {
        newsStore = nil
        viewModel = nil
    }

    func testFetchWhenFetchSuccessSetsItems() {
        let storyCollection = StoryCollection.mock
        newsStore.fetchStoryCollectionResult = .success(storyCollection)
        let expectedResult = storyCollection.data.count

        let expectation = XCTestExpectation(description: "viewModel.fetch")
        XCTAssertNil(viewModel.items)
        viewModel.fetch {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)

        let result = viewModel.items?.count

        XCTAssertEqual(result, expectedResult)
    }

    func testFetchWhenFetchSuccessSetsTitle() {
        let storyCollection = StoryCollection.mock
        newsStore.fetchStoryCollectionResult = .success(storyCollection)
        let expectedResult = storyCollection.title

        let expectation = XCTestExpectation(description: "viewModel.fetch")
        viewModel.fetch {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)

        let result = viewModel.title

        XCTAssertEqual(result, expectedResult)
    }

    func testFetchWhenFetchFailsSetsFetchError() {
        let expectedError = MockFetchError()
        newsStore.fetchStoryCollectionResult = .failure(expectedError)

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

    func testItemForIndexPathReturnsItem() {
        let storyCollection = StoryCollection.mock
        newsStore.fetchStoryCollectionResult = .success(storyCollection)
        let indexPath = IndexPath(row: 0, section: 0)
        let expectedResult = StoryListItemViewModel(item: storyCollection.data[0])

        let expectation = XCTestExpectation(description: "viewModel.fetch")
        viewModel.fetch {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)

        let result = viewModel.item(forIndexPath: indexPath)

        switch (result, expectedResult) {
        case (let .story(lhs), let .story(rhs)):
            XCTAssertEqual(lhs.id, rhs.id)

        default:
            XCTFail("Should not return non-story item")
        }
    }

    func testStoryIDForIndexPathWhenStoryReturnsStoryID() {
        let storyCollection = StoryCollection.mock
        newsStore.fetchStoryCollectionResult = .success(storyCollection)
        let indexPath = IndexPath(row: 0, section: 0)
        let expectedResult = Story.mock1.id

        let expectation = XCTestExpectation(description: "viewModel.fetch")
        viewModel.fetch {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)

        let result = viewModel.storyID(forIndexPath: indexPath)

        XCTAssertEqual(result, expectedResult)
    }

    func testStoryIDForIndexPathWhenNotStoryReturnsNil() {
        let storyCollection = StoryCollection.mock
        newsStore.fetchStoryCollectionResult = .success(storyCollection)
        let indexPath = IndexPath(row: 1, section: 0)

        let expectation = XCTestExpectation(description: "viewModel.fetch")
        viewModel.fetch {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)

        let result = viewModel.storyID(forIndexPath: indexPath)

        XCTAssertNil(result)
    }

}
