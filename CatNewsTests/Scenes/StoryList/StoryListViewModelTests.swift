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
        newsStore.fetchStoryCollectionResult = .success(mockStoryCollection)
        let expectedResult = mockStoryCollection.data.count

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
        newsStore.fetchStoryCollectionResult = .success(mockStoryCollection)
        let expectedResult = mockStoryCollection.title

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
        newsStore.fetchStoryCollectionResult = .success(mockStoryCollection)
        let indexPath = IndexPath(row: 0, section: 0)
        let expectedResult = StoryListItemViewModel(item: mockStoryCollection.data[0])

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
        newsStore.fetchStoryCollectionResult = .success(mockStoryCollection)
        let indexPath = IndexPath(row: 0, section: 0)
        let expectedResult = mockStoryCollectionStory1.id

        let expectation = XCTestExpectation(description: "viewModel.fetch")
        viewModel.fetch {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)

        let result = viewModel.storyID(forIndexPath: indexPath)

        XCTAssertEqual(result, expectedResult)
    }

    func testStoryIDForIndexPathWhenNotStoryReturnsNil() {
        newsStore.fetchStoryCollectionResult = .success(mockStoryCollection)
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
