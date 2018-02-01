#!/usr/bin/env bash

mkdir web/themes/custom/
RTD_DIR=web/themes/custom/rtdoked

cp -R web/themes/contrib/bootstrap/starterkits/cdn  $RTD_DIR
rename starterkit info $RTD_DIR/THEMENAME.starterkit.yml
find $RTD_DIR -type f -name 'THEMENAME.*' -exec rename THEMENAME rtdoked '{}' \;
find $RTD_DIR -type f -name '*.yml' -exec sed -i 's/THEMETITLE/ASU Theme/' {} \;
find $RTD_DIR -type f -name "*.yml" -exec sed -i  s/THEMENAME/rtdoked/g {} \;

# Add gulp file to theme
cp -R extras/gulp/* $RTD_DIR