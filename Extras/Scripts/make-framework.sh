#!/bin/bash

rm -rf build/nifly.xcframework
xcodebuild -create-xcframework -library build/src/libnifly.a -headers include/ -output build/nifly.xcframework
