#!/bin/bash

# Define the output directory.
output_directory=${1-'.'}

# Unpacks the .zip containing the .doccarchive files.
# The output directory will include the archive directory (eg. "docs/") by default.
unzip ./docs/docs.zip -d $output_directory
