//
//  StoryListItemViewModel.swift
//  CatNews
//
//  Created by Adam Young on 07/12/2020.
//

import Foundation

enum StoryListItemViewModel {

    case story(StoryListStoryViewModel)
    case weblink(StoryListWeblinkViewModel)
    case advert(StoryListAdvertViewModel)

}
