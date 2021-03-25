//
//  MockStoryImageData.swift
//  CatNews
//
//  Created by Adam Young on 25/03/2021.
//

import CatNewsCore
import Foundation

extension StoryImage {

    static var mock1: StoryImage {
        .init(
            url: URL(string: "https://some.domain.com/image1.jpg")!,
            accessibilityText: "Image 1 accessibility text"
        )
    }

    static var mock2: StoryImage {
        .init(
            url: URL(string: "https://some.domain.com/image2.jpg")!,
            accessibilityText: "Image 2 accessibility text"
        )
    }

}
