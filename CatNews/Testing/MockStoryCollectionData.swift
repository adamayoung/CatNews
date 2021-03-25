//
//  MockStoryCollectionData.swift
//  CatNews
//
//  Created by Adam Young on 09/12/2020.
//

import CatNewsCore
import Foundation

extension StoryCollection {

    static var mock: StoryCollection {
        .init(
            title: "Mock Cat News",
            data: [
                .story(.mock1),
                .weblink(.mock),
                .story(.mock3),
                .advert(.mock)
            ]
        )
    }

}
