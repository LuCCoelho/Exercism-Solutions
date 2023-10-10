#!/bin/bash

set -euo pipefail

cd dart/

for exercise in *; do 
[ -d $exercise ] && echo "Testing $exercise"; 
cd $exercise; 
dart pub get;
dart analyze;
dart test;
cd ..;
echo;
echo;
done