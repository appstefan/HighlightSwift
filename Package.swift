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
    dependencies: [],
    targets: [
        .target(
            name: "HighlightSwift",
            dependencies: [],
            resources: [.process("HighlightJS")]),
        .testTarget(
            name: "HighlightSwiftTests",
            dependencies: ["HighlightSwift"]),
    ]
)
