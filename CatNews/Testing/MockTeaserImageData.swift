//
//  MockTeaserImageData.swift
//  CatNews
//
//  Created by Adam Young on 25/03/2021.
//

import CatNewsCore
import Foundation

extension TeaserImage {

    static var mock1: TeaserImage {
        .init(
            links: TeaserImage.Links(
                url: TeaserImage.Links.LinkURL(
                    href: URL(string: "https://some.domain.com/image1a.jpg")!,
                    templated: true,
                    type: "image/jpg"
                )
            ),
            accessibilityText: "Accessibility text 1a"
        )
    }

    static var mock2: TeaserImage {
        .init(
            links: TeaserImage.Links(
                url: TeaserImage.Links.LinkURL(
                    href: URL(string: "https://some.domain.com/image2a.jpg")!,
                    templated: true,
                    type: "image/jpg"
                )
            ),
            accessibilityText: "Accessibility text 2a"
        )
    }

    static var mock3: TeaserImage {
        .init(
            links: TeaserImage.Links(
                url: TeaserImage.Links.LinkURL(
                    href: URL(string: "https://some.domain.com/image3a.jpg")!,
                    templated: true,
                    type: "image/jpg"
                )
            ),
            accessibilityText: "Accessibility text 3a"
        )
    }

}
