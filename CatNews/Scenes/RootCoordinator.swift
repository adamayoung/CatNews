//
//  RootCoordinator.swift
//  CatNews
//
//  Created by Adam Young on 07/12/2020.
//

import CatNewsCore
import os.log
import SafariServices
import UIKit

protocol RootCoordinating: Coordinating { }

final class RootCoordinator: RootCoordinating {

    private let navigationController: UINavigationController
    private let diContainer: DIContainer

    init(navigationController: UINavigationController, diContainer: DIContainer) {
        self.navigationController = navigationController
        self.diContainer = diContainer
    }

    func start() {
        os_log("Starting root coordinator", log: .app)
        let viewController: StoryListViewController = diContainer.resolve()
        viewController.delegate = self
        navigationController.viewControllers = [viewController]
    }

}

extension RootCoordinator: StoryListViewControllerDelegate {

    func viewController(_ viewController: StoryListViewController, wantsToViewStory storyID: String) {
        os_log("Viewing story %@", log: .app, storyID)
        let viewController: StoryDetailViewController = diContainer.resolve(storyID: storyID)
        navigationController.pushViewController(viewController, animated: true)
    }

    func viewController(_ viewController: StoryListViewController, wantsToViewWeblink url: URL) {
        os_log("Viewing weblink %@", log: .app, url.absoluteString)
        let viewController = SFSafariViewController(url: url)
        viewController.view.accessibilityLabel = "Web view - \(url.absoluteString)"
        navigationController.present(viewController, animated: true, completion: nil)
    }

}
