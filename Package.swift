// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "masterpass-sdk",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "masterpass-sdk",
            targets: ["masterpass-sdk-target"]
        ),
    ],
    targets: [
        .target(
            name: "masterpass-sdk-target",
            dependencies: [
                .target(name: "masterpass-sdk")
            ],
            path: "masterpasswrapper",
            publicHeadersPath: "include"
        ),
        .binaryTarget(name: "masterpass-sdk", path: "MfsIOSLibrary.xcframework")
    ]
)
