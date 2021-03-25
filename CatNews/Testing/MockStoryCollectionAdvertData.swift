//
//  MockStoryCollectionAdvertData.swift
//  CatNews
//
//  Created by Adam Young on 25/03/2021.
//

import CatNewsCore
import Foundation

extension StoryCollectionAdvert {

    static var mock: StoryCollectionAdvert {
        .init(
            url: URL(string: "https://some.domain.com/advert.jpg")!
        )

    }

}
