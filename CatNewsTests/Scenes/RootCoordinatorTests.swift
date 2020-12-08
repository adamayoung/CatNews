//
//  RootCoordinatorTests.swift
//  CatNewsTests
//
//  Created by Adam Young on 08/12/2020.
//

@testable import CatNews
import XCTest

class RootCoordinatorTests: XCTestCase {

    var rootCoordinator: RootCoordinator!
    var navigationController: UINavigationController!
    var diContainer: DIContainer!

    override func setUpWithError() throws {
        navigationController = UINavigationController()
        diContainer = DIContainer()
        rootCoordinator = RootCoordinator(navigationController: navigationController, diContainer: diContainer)
    }

    override func tearDownWithError() throws {
        navigationController = nil
        diContainer = nil
        rootCoordinator = nil
    }

    func testStartAddsStoryListViewControllerToNavigationController() {
        XCTAssertTrue(navigationController.viewControllers.isEmpty)

        rootCoordinator.start()

        XCTAssertTrue(navigationController.viewControllers.last is StoryListViewController)
    }

    func testStartSetsDelegateOnStoryListViewController() {
        rootCoordinator.start()

        guard let viewController = navigationController.viewControllers.last as? StoryListViewController else {
            XCTFail("Navigation controller has no view controllers")
            return
        }

        guard let delegate = viewController.delegate as? RootCoordinator else {
            XCTFail("Delegate is not of type `RootCoordinator`")
            return
        }

        XCTAssertTrue(delegate === rootCoordinator)
    }

}

extension RootCoordinatorTests {

    func testViewControllerWantsToViewStoryPushesStoryDetailsViewControllerOntoNavigationController() {
        let storyListViewController = StoryListViewController(
            viewModel: StoryListViewModel(newsStore: MockNewsStore())
        )
        let storyID = "1"

        rootCoordinator.viewController(storyListViewController, wantsToViewStory: storyID)

        XCTAssertTrue(navigationController.viewControllers.last is StoryDetailViewController)
    }

}
