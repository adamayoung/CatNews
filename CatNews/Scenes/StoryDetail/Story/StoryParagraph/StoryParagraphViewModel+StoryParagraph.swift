//
//  StoryParagraphViewModel+StoryParagraph.swift
//  CatNews
//
//  Created by Adam Young on 08/12/2020.
//

import CatNewsCore
import Foundation

extension StoryParagraphViewModel {

    convenience init(paragraph: StoryParagraph) {
        self.init(text: paragraph.text)
    }

}
