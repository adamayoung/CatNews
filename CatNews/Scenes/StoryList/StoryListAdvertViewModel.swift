//
//  StoryListAdvertViewModel.swift
//  CatNews
//
//  Created by Adam Young on 08/12/2020.
//

import Foundation

protocol StoryListAdvertViewModeling: class {

    var url: URL { get }

}

final class StoryListAdvertViewModel: StoryListAdvertViewModeling {

    let url: URL

    init(url: URL) {
        self.url = url
    }

}
