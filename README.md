# AudioKitDocs

## Generate Documentation

To generate documentation, simply clone this repository and run the following command:

```sh
swift run docgen <product> <product> <product> ... --output <output_directory>
```

This example will generate a `.doccarchive` for the `AudioKit` and `PianoRoll` _products_ from their respective packages and output to the `./output` directory.

```sh
swift run docgen AudioKit PianoRoll --output output
```
