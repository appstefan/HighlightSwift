// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "HighlightSwift",
    platforms: [
        .iOS(.v15),
        .tvOS(.v15),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "HighlightSwift",
            targets: ["HighlightSwift"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-collections.git",
            .upToNextMinor(from: "1.0.5")
        )
    ],
    targets: [
        .target(
            name: "HighlightSwift",
            dependencies: [
                .product(name: "Collections", package: "swift-collections")
            ],
            resources: [.process("HighlightJS")]),
        .testTarget(
            name: "HighlightSwiftTests",
            dependencies: ["HighlightSwift"]),
    ]
)
