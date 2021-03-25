//
//  StoryContentItem+StoryContent.swift
//  CatNews
//
//  Created by Adam Young on 08/12/2020.
//

import CatNewsCore
import Foundation

extension StoryContentItem {

    init(content: StoryContent) {
        switch content {
        case .paragraph(let paragraph):
            self = .paragraph(StoryParagraphViewModel(paragraph: paragraph))

        case .image(let image):
            self = .image(StoryImageViewModel(image: image))

        }
    }

}
