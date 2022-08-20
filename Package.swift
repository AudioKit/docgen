// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "AudioKitDocs",
    dependencies: [
        .package(url: "https://github.com/bdrelling/docgen", from: "0.1.7"),
        // Add packages you wish to generate documentation for here.
        .package(url: "https://github.com/AudioKit/AudioKit", from: "5.4.1"),
        .package(url: "https://github.com/AudioKit/PianoRoll", from: "1.0.1"),
    ]
)
