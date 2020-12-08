//
//  StoryListWeblinkViewModel.swift
//  CatNews
//
//  Created by Adam Young on 08/12/2020.
//

import Foundation

protocol StoryListWeblinkViewModeling: class {

    var id: String { get }

}

final class StoryListWeblinkViewModel: StoryListWeblinkViewModeling {

    let id: String

    init(id: String) {
        self.id = id
    }

}
