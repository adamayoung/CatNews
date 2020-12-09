//
//  MockDIContainer.swift
//  CatNews
//
//  Created by Adam Young on 09/12/2020.
//

import CatNewsCore
import Foundation

final class MockDIContainer: DIContainer {

    override func resolve() -> NewsStore {
        MockNewsStore()
    }

}
