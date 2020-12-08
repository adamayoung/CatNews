//
//  StoryParagraphViewModel.swift
//  CatNews
//
//  Created by Adam Young on 08/12/2020.
//

import Foundation

protocol StoryParagraphViewModeling {

    var text: String { get }
}

final class StoryParagraphViewModel: StoryParagraphViewModeling {

    let text: String

    init(text: String) {
        self.text = text
    }

}
