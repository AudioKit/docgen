#!/bin/bash

# Define the output directory.
output_directory=${1-'output'}

# Create the output directory.
mkdir $output_directory

# Define a function for generating a .doccarchive.
generate_archive() {
    product=$1

    echo "Generating archive for ${product} in ${output_directory}..."

    swift package --allow-writing-to-directory $output_directory \
        generate-documentation \
        --product $product \
        --output-path "${output_directory}/${product}.doccarchive"
}

# Add new entries for every product here.
# Note that this will only work with PRODUCTS within your dependency graph,
# if you need to work with targets, you'll have to update this script.
generate_archive AudioKit
generate_archive PianoRoll
