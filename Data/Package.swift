// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Data",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Data",
            targets: ["Data"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(path: "../Model"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", .upToNextMajor(from: "7.0.0")),
        .package(url: "https://github.com/apple/swift-collections", .upToNextMajor(from: "1.0.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Data",
            dependencies: [
                "Model",
                .product(name: "FirebaseFirestore", package: "firebase-ios-sdk"),
                .product(name: "FirebaseFirestoreSwift-Beta", package: "firebase-ios-sdk"),
                .product(name: "OrderedCollections", package: "swift-collections")
            ],
            resources: [
                .copy("Fixtures/CardList.json"),
                .copy("Fixtures/TravelTips.json")
            ]
        ),
        .testTarget(
            name: "DataTests",
            dependencies: ["Data"],
            resources: [
                .copy("TestData/CardList.json"),
                .copy("TestData/TravelTips.json")
            ]),
    ]
)
