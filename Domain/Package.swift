// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Domain",
            targets: ["Domain"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(path: "../Data"),
        .package(path: "../Model"),
        .package(url: "git@github.com:shortcut/shortcut-foundation-ios.git", from: "1.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Domain",
            dependencies: [
                "Data",
                "Model",
                .product(name: "ShortcutFoundation", package: "shortcut-foundation-ios")
            ],
            resources: [
                .copy("Fixtures/CardList.json"),
                .copy("Fixtures/TravelTips.json")
            ]
        ),
        .testTarget(
            name: "DomainTests",
            dependencies: ["Domain"],
            resources: [
                .copy("TestData/CardList.json"),
                .copy("TestData/TravelTips.json")
            ]),
    ]
)
