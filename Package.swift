// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "AudioKitDocs",
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
        // Add packages you wish to generate documentation for here.

        .package(url: "https://github.com/AudioKit/AudioKit", from: "5.5.0"),
        .package(url: "https://github.com/AudioKit/AudioKitEX", from: "5.0.0"),
        .package(url: "https://github.com/AudioKit/AudioKitUI", from: "0.2.0"),

        .package(url: "https://github.com/AudioKit/DevoloopAudioKit", from: "5.5.0"),
        .package(url: "https://github.com/AudioKit/DunneAudioKit", from: "5.5.0"),
        .package(url: "https://github.com/AudioKit/Keyboard", from: "1.3.2"),

        .package(url: "https://github.com/AudioKit/Microtonality", from: "5.4.0"),
        .package(url: "https://github.com/AudioKit/PianoRoll", from: "1.0.1"),
        .package(url: "https://github.com/AudioKit/SoundpipeAudioKit", from: "5.5.0"),

        .package(url: "https://github.com/AudioKit/SporthAudioKit", from: "5.5.0"),
        .package(url: "https://github.com/AudioKit/STKAudioKit", branch: "swiftbuild"),
        .package(url: "https://github.com/AudioKit/Tonic", from: "1.0.6"),
    ]
)
