//
//  MockStoryCollectionStoryData.swift
//  CatNews
//
//  Created by Adam Young on 25/03/2021.
//

import CatNewsCore
import Foundation

extension StoryCollectionStory {

    static var mock1: StoryCollectionStory {
        .init(
            id: "1",
            headline: "Headline 1",
            teaserText: "Teaster 1",
            creationDate: Date(timeIntervalSince1970: 1607432233),
            modifiedDate: Date(timeIntervalSince1970: 1607432233),
            teaserImage: .mock1
        )
    }

    static var mock3: StoryCollectionStory {
        .init(
            id: "3",
            headline: "Headline 3",
            teaserText: "Teaster 3",
            creationDate: Date(timeIntervalSince1970: 1607452233),
            modifiedDate: Date(timeIntervalSince1970: 1607452233),
            teaserImage: .mock3
        )
    }

}
