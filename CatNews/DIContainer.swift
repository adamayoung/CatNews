//
//  DIContainer.swift
//  CatNews
//
//  Created by Adam Young on 08/12/2020.
//

import CatNewsCore
import UIKit

class DIContainer {

    init() { }

    func resolve() -> NavigationControlling {
        UINavigationController()
    }

    func resolve(navigationController: NavigationControlling) -> RootCoordinating {
        RootCoordinator(navigationController: navigationController, diContainer: self)
    }

    func resolve() -> StoryListViewControlling {
        StoryListViewController(viewModel: resolve())
    }

    func resolve() -> StoryListViewModeling {
        StoryListViewModel(newsStore: resolve())
    }

    func resolve(storyID: String) -> StoryDetailViewControlling {
        StoryDetailViewController(viewModel: resolve(storyID: storyID))
    }

    func resolve(storyID: String) -> StoryDetailViewModeling {
        StoryDetailViewModel(storyID: storyID, newsStore: resolve())
    }

    func resolve() -> NewsStore {
        NewsHTTPStore.shared
    }

}
