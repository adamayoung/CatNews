//
//  StorySubheaderViewModel.swift
//  CatNews
//
//  Created by Adam Young on 08/12/2020.
//

import Foundation

protocol StorySubheaderViewModeling {

    var publishedDate: Date { get }

}

final class StorySubheaderViewModel: StorySubheaderViewModeling {

    let publishedDate: Date

    init(publishedDate: Date) {
        self.publishedDate = publishedDate
    }

}
