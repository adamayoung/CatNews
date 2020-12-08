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
    var isLoading: Bool { get }
    var story: Story? { get }

    func fetch(completion: @escaping () -> Void)

}

final class StoryDetailViewModel: StoryDetailViewModeling {

    let storyID: String
    private(set) var isLoading = false
    private(set) var story: Story?

    private let newsStore: NewsStore

    init(storyID: String, newsStore: NewsStore) {
        self.storyID = storyID
        self.newsStore = newsStore
    }

    func fetch(completion: @escaping () -> Void) {
        os_log("Fetching story %@...", log: .app, storyID)

        isLoading = true
        newsStore.fetchStory(withID: storyID) { [weak self] result in
            guard let self = self else {
                return
            }

            defer {
                DispatchQueue.main.async {
                    completion()
                }
            }

            self.isLoading = false
            os_log("Fetched story %@", log: .app, self.storyID)
            self.story = try? result.get()
        }
    }

}
