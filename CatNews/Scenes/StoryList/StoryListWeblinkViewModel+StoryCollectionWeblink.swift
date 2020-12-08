//
//  StoryListWeblinkViewModel+StoryCollectionWeblink.swift
//  CatNews
//
//  Created by Adam Young on 08/12/2020.
//

import CatNewsCore
import Foundation

extension StoryListWeblinkViewModel {

    convenience init(weblink: StoryCollectionWeblink) {
        self.init(id: weblink.id, headline: weblink.headline, url: weblink.weblinkUrl,
                  imageURL: weblink.teaserImage.links.url.href,
                  imageAccessibilityText: weblink.teaserImage.accessibilityText, publishedDate: weblink.creationDate)
    }

}
