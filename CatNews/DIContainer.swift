//
//  DIContainer.swift
//  CatNews
//
//  Created by Adam Young on 08/12/2020.
//

import CatNewsCore
import UIKit

struct DIContainer {

    func resolve(navigationController: UINavigationController) -> RootCoordinating {
        RootCoordinator(navigationController: navigationController, diContainer: self)
    }

}

extension DIContainer {

    func resolve() -> StoryListViewController {
        StoryListViewController(viewModel: resolve())
    }

    private func resolve() -> StoryListViewModeling {
        StoryListViewModel(newsStore: resolve())
    }

}

extension DIContainer {

    func resolve(storyID: String) -> StoryDetailViewController {
        StoryDetailViewController(viewModel: resolve(storyID: storyID))
    }

    func resolve(storyID: String) -> StoryDetailViewModeling {
        StoryDetailViewModel(storyID: storyID, newsStore: resolve())
    }

}

extension DIContainer {

    private func resolve() -> NewsStore {
        NewsMockStore()
    }

}
