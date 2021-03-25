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

extension StoryCollectionStory {

    static var mock1: StoryCollectionStory {
        .init(
            id: "1",
            headline: "Headline 1",
            teaserText: "Teaster 1",
            creationDate: Date(timeIntervalSince1970: 1607432233),
            modifiedDate: Date(timeIntervalSince1970: 1607432233),
            teaserImage: TeaserImage(
                links: TeaserImage.Links(
                    url: TeaserImage.Links.LinkURL(
                        href: URL(string: "https://some.domain.com/image1a.jpg")!,
                        templated: true,
                        type: "image/jpg"
                    )
                ),
                accessibilityText: "Accessibility text 1a"
            )
        )
    }

    static var mock3: StoryCollectionStory {
        .init(
            id: "3",
            headline: "Headline 3",
            teaserText: "Teaster 3",
            creationDate: Date(timeIntervalSince1970: 1607452233),
            modifiedDate: Date(timeIntervalSince1970: 1607452233),
            teaserImage: TeaserImage(
                links: TeaserImage.Links(
                    url: TeaserImage.Links.LinkURL(
                        href: URL(string: "https://some.domain.com/image3a.jpg")!,
                        templated: true,
                        type: "image/jpg"
                    )
                ),
                accessibilityText: "Accessibility text 3a"
            )
        )
    }

}

extension StoryCollectionWeblink {

    static var mock: StoryCollectionWeblink {
        .init(
            id: "2",
            headline: "Weblink 2",
            weblinkUrl: URL(string: "https://www.sky.com")!,
            creationDate: Date(timeIntervalSince1970: 1607442233),
            modifiedDate: Date(timeIntervalSince1970: 1607442233),
            teaserImage: TeaserImage(
                links: TeaserImage.Links(
                    url: TeaserImage.Links.LinkURL(
                        href: URL(string: "https://some.domain.com/image2a.jpg")!,
                        templated: true,
                        type: "image/jpg"
                    )
                ),
                accessibilityText: "Accessibility text 2a"
            )
        )
    }

}

extension StoryCollectionAdvert {

    static var mock: StoryCollectionAdvert {
        .init(
            url: URL(string: "https://some.domain.com/advert.jpg")!
        )

    }

}
