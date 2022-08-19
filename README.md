# docgen

[![Latest Release](https://img.shields.io/github/v/tag/bdrelling/docgen?color=blue&label=latest)](https://github.com/bdrelling/docgen/releases)
[![Swift Compatibility](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fbdrelling%2Fdocgen%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/bdrelling/docgen)
[![Platform Compatibility](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fbdrelling%2Fdocgen%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/bdrelling/docgen)
[![License](https://img.shields.io/github/license/bdrelling/docgen)](https://github.com/bdrelling/docgen/blob/main/LICENSE)

`docgen` is a Swift command-line utility template for generating on-demand DocC archives across multiple packages and products with just a few lines of code.

## Disclaimer

:warning: This project is a template; it is **not** meant to be used as a dependency.

Additionally, if you only need to generate documentation for a single package that you own, you should use the [swift-docc-plugin](https://github.com/apple/swift-docc-plugin) directly. Check out its [thorough documentation](https://apple.github.io/swift-docc-plugin/documentation/swiftdoccplugin/) for more information.

## Usage

1. Create a new repository using this as a template.
2. Add your Swift Package dependencies to the `Package.swift` file. You **do not** need to add these dependencies anywhere else in the file. This will prevent these dependencies from being pulled in by other projects that depend on this package.
3. Add the products you wish to generate documentation for to the `DocGenCommand.products` property.
4. Finally, run `swift run docgen` in your project directory. All `.doccarchive` archives will be in the `/output` directory.

## Notes

- The [swift-docc-plugin](https://github.com/apple/swift-docc-plugin) was introduced at WWDC'22.

## License

`docgen` is released under the MIT license. See [LICENSE](/LICENSE) for details.
