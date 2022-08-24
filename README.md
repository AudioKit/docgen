# docgen

`docgen` is a simple utility for generating documentation across AudioKit repositories. This allows us to keep our Vapor website lean without requiring large file storage, while also providing us with a local utility for seeing all of our documentation in one place.

## Usage

### Adding New Documentation

1. Add the repository to the `Package.swift` just as you normally would.
2. Add _each package product_ (could be one or multiple) you want to generate documentation for to the bottom of `scripts/docgen.sh`.

### Generate Documentation

To generate documentation, simply clone this repository and run the following command:

```sh
scripts/generate.sh
```

This example will generate a `.doccarchive` for all products defined in [`scripts/generate.sh`](/scripts/generate.sh) from their respective packages and output to the `./docs` directory.

You can change the output directory by calling:

```sh
./scripts/generate.sh <output_directory>
```

### Preview Documentation

This hasn't gotten a lot of attention yet so it may be broken, but you can preview the documentation by running the following command:

```sh
scripts/preview.sh
```

The command will output information on how to view it locally.

## Additional Notes

A standalone `Package.swift` in a repository without any `Sources` directory or `target` definitions is probably a weird sight. So why aren't we just passing URLs into a command and outputting the products?

That's definitely doable, but the `docgen` command takes advantage of Swift Package Manager and [swift-docc-plugin](https://github.com/apple/swift-docc-plugin) in order to ensure that:

1. Packages resolve properly.
2. Products are identified.
3. Version control is provided to us.

There is a downside: this project's minimum deployment target would need to be raised if _any_ downstream dependency requires a higher deployment target.

This _should_ be fine, as this package should be run on CI/CD systems and not used for consumers. If we run into problems with it later on, we can always re-evaluate -- the tl;dr is that DocC generation and hosting is easy.
