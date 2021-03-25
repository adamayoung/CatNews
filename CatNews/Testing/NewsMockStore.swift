//
//  NewsMockStore.swift
//  CatNews
//
//  Created by Adam Young on 09/12/2020.
//

import CatNewsCore
import Foundation

final class MockNewsStore: NewsStore {

    init() { }

    func fetchStoryCollection(completion: @escaping (Result<StoryCollection, Error>) -> Void) {
        DispatchQueue.main.async {
            completion(.success(StoryCollection.mock))
        }
    }

    func fetchStory(withID id: String, completion: @escaping (Result<Story?, Error>) -> Void) {
        DispatchQueue.main.async {
            switch id {
            case "1":
                completion(.success(Story.mock1))

            case "3":
                completion(.success(Story.mock3))

            default:
                completion(.success(nil))
            }
        }
    }

}
