//
//  StoryListAdvertViewModel+StoryCollectionAdvert.swift
//  CatNews
//
//  Created by Adam Young on 08/12/2020.
//

import CatNewsCore
import Foundation

extension StoryListAdvertViewModel {

    convenience init(advert: StoryCollectionAdvert) {
        self.init(url: advert.url)
    }

}
