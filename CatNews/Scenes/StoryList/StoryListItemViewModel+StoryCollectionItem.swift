//
//  StoryListItemViewModel+StoryCollectionItem.swift
//  CatNews
//
//  Created by Adam Young on 08/12/2020.
//

import CatNewsCore
import Foundation

extension StoryListItemViewModel {

    init(item: StoryCollectionItem) {
        switch item {
        case .story(let story):
            self = .story(StoryListStoryViewModel(story: story))

        case .weblink(let weblink):
            self = .weblink(StoryListWeblinkViewModel(weblink: weblink))

        case .advert(let advert):
            self = .advert(StoryListAdvertViewModel(advert: advert))
        }
    }

}
