//
//  StoryImageViewModel+StoryImage.swift
//  CatNews
//
//  Created by Adam Young on 08/12/2020.
//

import CatNewsCore
import Foundation

extension StoryImageViewModel {

    convenience init(image: StoryImage) {
        self.init(url: image.url, accessibilityText: image.accessibilityText)
    }

}
