//
//  StoryDetailViewModel.swift
//  CatNews
//
//  Created by Adam Young on 07/12/2020.
//

import CatNewsCore
import Foundation
import os.log

protocol StoryDetailViewModeling {

    var storyID: String { get }
    var story: StoryViewModeling? { get }
    var fetchError: Error? { get }

    func fetch(completion: @escaping () -> Void)

}

final class StoryDetailViewModel: StoryDetailViewModeling {

    let storyID: String
    private(set) var story: StoryViewModeling?
    private(set) var fetchError: Error?

    private let newsStore: NewsStore

    init(storyID: String, newsStore: NewsStore) {
        self.storyID = storyID
        self.newsStore = newsStore
    }

    func fetch(completion: @escaping () -> Void) {
        os_log("Fetching story %@...", log: .app, storyID)

        newsStore.fetchStory(withID: storyID) { [weak self] result in
            guard let self = self else {
                return
            }

            defer {
                DispatchQueue.main.async {
                    completion()
                }
            }

            do {
                guard let story = try result.get() else {
                    os_log("Story %@ not found", log: .app, type: .error, self.storyID)
                    throw StoryNotFoundError()
                }

                os_log("Fetched story %@", log: .app, self.storyID)
                self.story = StoryViewModel(story: story)
            } catch let error {
                os_log("Error fetching story %@: %@", log: .app, type: .error, self.storyID, error.localizedDescription)
                self.fetchError = error
            }
        }
    }

}

extension StoryDetailViewModel {

    struct StoryNotFoundError: Error { }

}
