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

    func resolve(navigationController: UINavigationController) -> RootCoordinating {
        RootCoordinator(navigationController: navigationController, diContainer: self)
    }

    func resolve() -> StoryListViewController {
        StoryListViewController(viewModel: resolve())
    }

    func resolve() -> StoryListViewModeling {
        StoryListViewModel(newsStore: resolve())
    }

    func resolve(storyID: String) -> StoryDetailViewController {
        StoryDetailViewController(viewModel: resolve(storyID: storyID))
    }

    func resolve(storyID: String) -> StoryDetailViewModeling {
        StoryDetailViewModel(storyID: storyID, newsStore: resolve())
    }

    func resolve() -> NewsStore {
        NewsHTTPStore.shared
    }

}
