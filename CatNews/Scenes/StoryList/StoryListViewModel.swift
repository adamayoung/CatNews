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

    var title: String? { get }
    var items: [StoryListItemViewModel]? { get }
    var fetchError: Error? { get }

    func fetch(completion: @escaping () -> Void)

    func item(forIndexPath indexPath: IndexPath) -> StoryListItemViewModel

    func storyID(forIndexPath indexPath: IndexPath) -> String?

}

final class StoryListViewModel: StoryListViewModeling {

    private(set) var title: String?
    private(set) var items: [StoryListItemViewModel]?

    private(set) var fetchError: Error?

    private let newsStore: NewsStore

    init(newsStore: NewsStore) {
        self.newsStore = newsStore
    }

    func fetch(completion: @escaping () -> Void) {
        os_log("Fetching stories...", log: .app)

        fetchError = nil

        newsStore.fetchStoryCollection { [weak self] result in
            defer {
                DispatchQueue.main.async {
                    completion()
                }
            }

            do {
                let storyCollection = try result.get()
                self?.didFetch(storyCollection: storyCollection)
                os_log("Fetched %d stories", log: .app, storyCollection.data.count)
            } catch let error {
                os_log("Error fetching stories: %@", log: .app, type: .error, error.localizedDescription)
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
        self.title = storyCollection.title
        self.items = storyCollection.data.map(StoryListItemViewModel.init)
    }

}
