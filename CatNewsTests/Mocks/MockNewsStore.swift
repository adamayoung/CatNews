//
//  MockNewsStore.swift
//  CatNewsTests
//
//  Created by Adam Young on 08/12/2020.
//

import CatNewsCore
import Foundation

final class MockNewsStore: NewsStore {

    var fetchStoryCollectionResult: Result<StoryCollection, Error>?
    var fetchStoreLastID: String?
    var fetchStoryResult: Result<Story?, Error>?

    func fetchStoryCollection(completion: @escaping (Result<StoryCollection, Error>) -> Void) {
        guard let result = fetchStoryCollectionResult else {
            return
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(result)
        }
    }

    func fetchStory(withID id: String, completion: @escaping (Result<Story?, Error>) -> Void) {
        fetchStoreLastID = id

        guard let result = fetchStoryResult else {
            return
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(result)
        }
    }

}
