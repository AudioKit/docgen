#!/bin/bash

# Define the output directory.
output_directory=${1-'.'}

unzip ./docs/docs.zip -d $output_directory
