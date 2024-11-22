// swift-tools-version: 5.7
import PackageDescription

 let package = Package(
     name: "DangerExample-PRLinter",
     defaultLocalization: "en",
     products: [
       .library(name: "DangerDeps", type: .dynamic, targets: ["DangerExample-PRLinter"])
     ],
     dependencies: [
         .package(url: "https://github.com/danger/swift.git", from: "3.12.3")
     ],
     targets: [
         .target(
             name: "DangerExample-PRLinter",
             dependencies: [
                 .product(name: "Danger", package: "swift")
             ],
             path: "DangerExample",
             sources: ["Stringfy.swift"]
         )
     ]
 )