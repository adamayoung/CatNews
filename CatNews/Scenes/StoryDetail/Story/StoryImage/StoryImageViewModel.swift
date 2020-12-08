//
//  StoryImageViewModel.swift
//  CatNews
//
//  Created by Adam Young on 08/12/2020.
//

import Foundation

protocol StoryImageViewModeling {

    var url: URL { get }
    var accessibilityText: String { get }

}

final class StoryImageViewModel: StoryImageViewModeling {

    let url: URL
    let accessibilityText: String

    init(url: URL, accessibilityText: String) {
        self.url = url
        self.accessibilityText = accessibilityText
    }

}
