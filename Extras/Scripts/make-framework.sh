#!/bin/bash

rm -rf Package/ObjCNifly.xcframework
xcodebuild archive -project SwiftNifly.xcodeproj -scheme "ObjCNifly" -destination="macOS" -archivePath Package/libObjCNifly SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
xcodebuild -create-xcframework -archive Package/libObjCNifly.xcarchive -library libObjCNifly.a -output Package/ObjCNifly.xcframework
swift build --package-path Package/
