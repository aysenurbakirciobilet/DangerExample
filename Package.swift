// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DangerExample",
    defaultLocalization: "en",
     products: [
       .library(name: "DangerDeps", type: .dynamic, targets: ["DangerExample"])
     ],
    dependencies: [
         .package(url: "https://github.com/danger/swift.git", from: "3.20.2")
     ],
    targets: [
        .target(
             name: "DangerExample",
             dependencies: [
                 .product(name: "Danger", package: "swift")
             ],
             path: "DangerExample",
             sources: ["Stringfy.swift"]
         )
    ]
)