#!/bin/bash

cd dart/

for exercise in *; do 
[ -d $exercise ] && echo "Testing $exercise"; 
cd $exercise; 
dart pub get;
dart format --output=none --set-exit-if-changed .;
dart analyze;
dart test;
cd ..;
echo;
echo;
done