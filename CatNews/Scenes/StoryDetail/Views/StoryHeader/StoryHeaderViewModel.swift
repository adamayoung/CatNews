//
//  StoryHeaderViewModel.swift
//  CatNews
//
//  Created by Adam Young on 08/12/2020.
//

import Foundation

protocol StoryHeaderViewModeling {

    var headlineText: String { get }
    var heroImageURL: URL { get }
    var heroImageAccessibilityText: String { get }
    var createdDate: Date { get }

}

final class StoryHeaderViewModel: StoryHeaderViewModeling {

    let headlineText: String
    let heroImageURL: URL
    let heroImageAccessibilityText: String
    let createdDate: Date

    init(headlineText: String, heroImageURL: URL, heroImageAccessibilityText: String, createdDate: Date) {
        self.headlineText = headlineText
        self.heroImageURL = heroImageURL
        self.heroImageAccessibilityText = heroImageAccessibilityText
        self.createdDate = createdDate
    }

}
