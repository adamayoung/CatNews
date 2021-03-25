//
//  MockHeroImageData.swift
//  CatNews
//
//  Created by Adam Young on 25/03/2021.
//

import CatNewsCore
import Foundation

extension HeroImage {

    static var mock: HeroImage {
        .init(
            imageUrl: URL(string: "https://some.domain.com/image.jpg")!,
            accessibilityText: "Accessibility text"
        )
    }

}
