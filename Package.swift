// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftCBUUIDKit",
    products: [
        .library(
            name: "SwiftCBUUIDKit",
            targets: ["SwiftCBUUIDKit"]
        ),
    ],
    targets: [
        .target(
            name: "CBUUIDHelper",
            path: "Sources/CBUUIDHelper",
            publicHeadersPath: "."
        ),
        .target(
            name: "SwiftCBUUIDKit",
            dependencies: ["CBUUIDHelper"],
            path: "Sources/SwiftCBUUIDKit"
        ),
        .testTarget(
            name: "SwiftCBUUIDKitTests",
            dependencies: ["SwiftCBUUIDKit"]
        )
    ]
)
