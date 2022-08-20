# AudioKitDocs

## Generate Documentation

To generate documentation, simply clone this repository and run the following command:

```sh
scripts/docgen.sh
```

This example will generate a `.doccarchive` for all products defined in [`scripts/docgen.sh`](/scripts/docgen.sh) from their respective packages and output to the `./output` directory.

You can change the output directory by calling:

```sh
./docgen.sh <output_directory>
```

## Preview Documentation

This hasn't gotten a lot of attention yet so it may be broken, but you can preview the documentation by running the following command:

```sh
scripts/preview.sh
```

The command will output information on how to view it locally.

## Context

A standalone `Package.swift` in a repository without any `Sources` directory or `target` definitions is probably a weird sight. So why aren't we just passing URLs into a command and outputting the products?

That's definitely doable, but the `docgen` command takes advantage of Swift Package Manager and [swift-docc-plugin](https://github.com/apple/swift-docc-plugin) in order to ensure that:

1. Packages resolve properly.
2. Products are identified.
3. Version control is provided to us.

There is a downside: this project's minimum deployment target would need to be raised if _any_ downstream dependency requires a higher deployment target.

This _should_ be fine, as this package should be run on CI/CD systems and not used for consumers. If we run into problems with it later on, we can always re-evaluate -- the tl;dr is that DocC generation and hosting is easy.
