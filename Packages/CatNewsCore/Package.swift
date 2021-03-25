// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "CatNewsCore",

    platforms: [
        .macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6)
    ],

    products: [
        .library(
            name: "CatNewsCore",
            targets: ["CatNewsCore"]
        )
    ],

    dependencies: [],

    targets: [
        .target(
            name: "CatNewsCore",
            dependencies: []
        ),
        .testTarget(
            name: "CatNewsCoreTests",
            dependencies: ["CatNewsCore"],
            resources: [
                .copy("MockData")
            ]
        )
    ]
)
