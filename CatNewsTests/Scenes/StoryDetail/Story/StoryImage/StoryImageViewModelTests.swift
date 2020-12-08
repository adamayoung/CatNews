//
//  StoryImageViewModelTests.swift
//  CatNewsTests
//
//  Created by Adam Young on 08/12/2020.
//

@testable import CatNews
import CatNewsCore
import XCTest

class StoryImageViewModelTests: XCTestCase {

    func testInitWithImage() {
        let image = StoryImage(
            url: URL(string: "https://some.domain.com/image.jpg")!,
            accessibilityText: "Accessibility text"
        )

        let viewModel = StoryImageViewModel(image: image)

        XCTAssertEqual(viewModel.url, image.url)
        XCTAssertEqual(viewModel.accessibilityText, image.accessibilityText)
    }

}
