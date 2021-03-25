//
//  MockStoryData.swift
//  CatNews
//
//  Created by Adam Young on 09/12/2020.
//

import CatNewsCore
import Foundation

extension Story {

    static var mock1: Story {
        .init(
            id: "1",
            headline: "Headline 1",
            heroImage: .mock,
            creationDate: Date(timeIntervalSinceNow: -64000),
            modifiedDate: Date(timeIntervalSinceNow: -64000),
            contents: [
                .paragraph(.mock1),
                .image(.mock1),
                .paragraph(.mock2),
                .image(.mock2)
            ]
        )
    }

    static var mock3: Story {
        .init(
            id: "3",
            headline: "Headline 3",
            heroImage: .mock,
            creationDate: Date(timeIntervalSinceNow: -64000),
            modifiedDate: Date(timeIntervalSinceNow: -64000),
            contents: [
                .paragraph(.mock1),
                .image(.mock1),
                .paragraph(.mock2),
                .image(.mock2)
            ]
        )

    }

}
