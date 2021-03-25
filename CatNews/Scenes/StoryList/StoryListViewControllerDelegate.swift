//
//  StoryListViewControllerDelegate.swift
//  CatNews
//
//  Created by Adam Young on 25/03/2021.
//

import Foundation

protocol StoryListViewControllerDelegate: class {

    func viewController(_ viewController: StoryListViewController, wantsToViewStory storyID: String)

    func viewController(_ viewController: StoryListViewController, wantsToViewWeblink url: URL)

}
