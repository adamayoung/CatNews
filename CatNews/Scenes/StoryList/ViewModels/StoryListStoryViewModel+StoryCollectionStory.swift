//
//  StoryCollectionItemViewModel+StoryCollectionStory.swift
//  CatNews
//
//  Created by Adam Young on 07/12/2020.
//

import CatNewsCore
import Foundation

extension StoryListStoryViewModel {

    convenience init(story: StoryCollectionStory) {
        self.init(id: story.id, headline: story.headline, teaserText: story.teaserText,
                  imageURL: story.teaserImage.links.url.href,
                  imageAccessibilityText: story.teaserImage.accessibilityText, publishedDate: story.creationDate)
    }

}
