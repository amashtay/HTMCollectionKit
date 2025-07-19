// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "HTMCollectionKit",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "HTMCollectionKit",
            targets: ["HTMCollectionKit"]
        )
    ],
    targets: [
        .target(
            name: "HTMCollectionKit",
            path: "Sources/HTMCollectionKit"
        )
    ]
)
