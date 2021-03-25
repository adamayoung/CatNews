//
//  MockStoryCollectionWeblinkData.swift
//  CatNews
//
//  Created by Adam Young on 25/03/2021.
//

import CatNewsCore
import Foundation

extension StoryCollectionWeblink {

    static var mock: StoryCollectionWeblink {
        .init(
            id: "2",
            headline: "Weblink 2",
            weblinkUrl: URL(string: "https://www.sky.com")!,
            creationDate: Date(timeIntervalSince1970: 1607442233),
            modifiedDate: Date(timeIntervalSince1970: 1607442233),
            teaserImage: .mock2
        )
    }

}
