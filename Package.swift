// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "AudioKitDocs",
    platforms: [
       .macOS(.v11),
    ],
    dependencies: [
        .package(url: "https://github.com/bdrelling/docgen", from: "0.1.6"),
        // Add packages you wish to generate documentation for here.
        .package(url: "https://github.com/AudioKit/AudioKit", from: "5.4.1"),
        .package(url: "https://github.com/AudioKit/PianoRoll", from: "1.0.1"),
    ]
)
