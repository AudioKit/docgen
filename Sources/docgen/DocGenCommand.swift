// Copyright © 2022 Brian Drelling. All rights reserved.

import ArgumentParser
import Foundation

@main
struct DocGenCommand: ParsableCommand {
    static let configuration: CommandConfiguration = .init(
        commandName: "docgen",
        abstract: "Generates DocC documentation archives dependent products."
    )
    
    /// Our `FileManager` for the command.
    private static let fileManager: FileManager = .default
    
    /// The collection of products to generate documentation for.
    ///
    /// Each product in this array should correspond to products within dependencies in Package.swift.
    /// Multiple products can be output from a specific package, so every product must be listed independently.
    private var products: [String] = [
        "AudioKit",
        "PianoRoll",
    ]
    
    init() {}
    
    /// The `run` function is called when this command is executed.
    mutating func run() throws {
        // The project directory -- NOT the target directory.
        // eg. "AudioKitDocGen", not "AudioKitDocGen/docgen"
        let projectDirectory = FileManager.default.currentDirectoryPath
        
        // The output directory.
        let outputDirectory = projectDirectory.appending("/output")
        
        // Delete the output directory (if it exists).
        // This ensures that we won't end up with documentation in mixed states,
        // such as stale packages that weren't updated due to a build error.
        try? Self.fileManager.removeItem(atPath: outputDirectory)

        // Recreate the output directory.
        try Self.fileManager.createDirectory(atPath: outputDirectory, withIntermediateDirectories: true)
        
        // Generate documentation for each product.
        try self.generateDocumentation(
            for: self.products,
            outputDirectory: outputDirectory
        )
    }
    
    /// Generates documentation for a list of products.
    /// All products must exist within the dependency graph for this Swift Package.
    /// - Parameters:
    ///   - products: The products to generate documentation for.
    ///   - outputDirectory: The output directory for generated documentation.
    private func generateDocumentation(for products: [String], outputDirectory: String) throws {
        try products.forEach { product in
            try self.generateDocumentation(for: product, outputDirectory: outputDirectory)
        }
    }
    
    /// Generates documentation for a specified product.
    /// The product must exist within the dependency graph for this Swift Package.
    /// - Parameters:
    ///   - product: The product to generate documentation for.
    ///   - outputDirectory: The output directory for generated documentation.
    private func generateDocumentation(for product: String, outputDirectory: String) throws {
        // Our output path should specify the .doccarchive, otherwise it is output as a directory.
        let outputPath = outputDirectory.appending("/\(product).doccarchive")
        
        // This command runs swift-docc-plugin.
        // The --allow-writing-to-directory flag must come before the command.
        // Variables are wrapped in '' rather than "" to restrict user-prone errors, like variable injection.
        let command = """
        swift package --allow-writing-to-directory '\(outputDirectory)' generate-documentation \
            --product '\(product)' \
            --output-path '\(outputPath)' \
            --hosting-base-path '\(product)'
        """
        
        // Currently, the above command outputs a package that requires redirect compatibility.
        // If we find that we don't have access to the redirect functionality we need, we can generate docs for static hosting.
        // For more information on static hosting, see "Transforming for Static Hosting" here:
        // https://apple.github.io/swift-docc-plugin/documentation/swiftdoccplugin/generating-documentation-for-hosting-online
        //
        // The tl;dr is that adding the following flag will allow static access:
        // --transform-for-static-hosting
        
        // Finally, run our command.
        try ConfiguredProcess.bash(command: command).run()
    }
}
