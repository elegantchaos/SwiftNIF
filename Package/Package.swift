// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "nifly",
    
    platforms: [
        .macOS(.v12)
    ],
    
    products: [
        .library(name: "nifly", targets: ["SwiftNifly"])
    ],
    
    dependencies: [
    ],
    
    targets: [
        .target(
            name: "SwiftNifly",
            dependencies: [
                "ObjCNifly"
            ]
        ),
        
        .binaryTarget(
            name: "ObjCNifly",
            path: "ObjCNifly.xcframework"
        ),
        
        .testTarget(
            name: "SwiftNiflyTests",
            dependencies: [
                "SwiftNifly"
            ]
        )
    ]
)
