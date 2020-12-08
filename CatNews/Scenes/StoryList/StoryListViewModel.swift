//
//  StoryListViewModel.swift
//  CatNews
//
//  Created by Adam Young on 07/12/2020.
//

import CatNewsCore
import Foundation
import os.log

protocol StoryListViewModeling {

    var isLoading: Bool { get }
    var title: String { get }
    var items: [StoryListItemViewModel]? { get }
    var fetchError: Error? { get }

    func fetch(completion: @escaping () -> Void)

    func item(forIndexPath indexPath: IndexPath) -> StoryListItemViewModel

    func storyID(forIndexPath indexPath: IndexPath) -> String?

}

final class StoryListViewModel: StoryListViewModeling {

    private(set) var isLoading = false
    private(set) var title = ""
    private(set) var items: [StoryListItemViewModel]?

    private(set) var fetchError: Error?

    private let newsStore: NewsStore

    init(newsStore: NewsStore) {
        self.newsStore = newsStore
    }

    func fetch(completion: @escaping () -> Void) {
        os_log("Fetching Stories...", log: .app)

        fetchError = nil

        newsStore.fetchStoryCollection { [weak self] result in
            defer {
                DispatchQueue.main.async {
                    completion()
                }
            }

            do {
                self?.didFetch(storyCollection: try result.get())
            } catch let error {
                self?.fetchError = error
            }
        }
    }

    func item(forIndexPath indexPath: IndexPath) -> StoryListItemViewModel {
        guard let items = self.items else {
            fatalError()
        }

        return items[indexPath.row]
    }

    func storyID(forIndexPath indexPath: IndexPath) -> String? {
        let thisItem = item(forIndexPath: indexPath)
        switch thisItem {
        case .story(let story):
            return story.id

        default:
            return nil
        }
    }

}

extension StoryListViewModel {

    private func didFetch(storyCollection: StoryCollection) {
        os_log("Stories fetched", log: .app)
        self.title = storyCollection.title
        self.items = storyCollection.data.map(StoryListItemViewModel.init)
    }

}
