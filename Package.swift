// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "docgen",
    platforms: [
       .macOS(.v12)
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.1.3"),
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
        // Add packages you wish to generate documentation for here.
        .package(url: "https://github.com/AudioKit/AudioKit", from: "5.4.1"),
        .package(url: "https://github.com/AudioKit/PianoRoll", from: "1.0.1"),
    ],
    targets: [
        .executableTarget(
            name: "docgen", 
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        )
    ]
)
