//
//  StoryCollectionItemViewModel.swift
//  CatNews
//
//  Created by Adam Young on 07/12/2020.
//

import UIKit

protocol StoryListStoryViewModeling: class {

    var id: String { get }
    var headline: String { get }
    var teaserText: String { get }
    var imageURL: URL { get }
    var imageAccessibilityText: String { get }

}

final class StoryListStoryViewModel: StoryListStoryViewModeling {

    let id: String
    let headline: String
    let teaserText: String
    let imageURL: URL
    let imageAccessibilityText: String

    init(id: String, headline: String, teaserText: String, imageURL: URL, imageAccessibilityText: String) {
        self.id = id
        self.headline = headline
        self.teaserText = teaserText
        self.imageURL = imageURL
        self.imageAccessibilityText = imageAccessibilityText
    }


}
