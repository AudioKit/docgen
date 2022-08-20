#!/bin/bash

product=${1-'AudioKit'}

swift package --disable-sandbox preview-documentation --product $product
