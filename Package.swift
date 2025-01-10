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
    dependencies: [
        .package(url: "https://github.com/krzyzanowskim/OpenSSL-Package.git", exact: "3.3.2000"),
        .package(url: "https://github.com/BoynerGroup/jsonmodel", exact: "1.8.1"),
        .package(url: "https://github.com/AFNetworking/AFNetworking", exact: "4.0.1"),
    ],
    targets: [
        .target(
            name: "masterpass-sdk-target",
            dependencies: [
                .product(name: "OpenSSL", package: "OpenSSL-Package"),
                .product(name: "AFNetworking", package: "AFNetworking"),
                .product(name: "JSONModel", package: "jsonmodel"),
                .target(name: "masterpass-sdk"),
            ],
            path: "masterpasswrapper",
            publicHeadersPath: "include"
        ),
        .binaryTarget(name: "masterpass-sdk", path: "MfsIOSLibrary.xcframework")
    ]
)
