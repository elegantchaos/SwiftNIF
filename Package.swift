
// swift-tools-version:5.6

// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 31/01/2022.
//  All code (c) 2022 - present day, Elegant Chaos.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import PackageDescription

let package = Package(
    name: "SwiftNifly",
    platforms: [
        .macOS(.v12)
    ],
    targets: [
        .target(
            name: "SwiftNifly",
            dependencies: [
                "ObjCNifly"
            ],
            cSettings: [
                .unsafeFlags(["-fmodules"])
            ],
            cxxSettings: [
                .unsafeFlags(["-fcxx-modules", "-std=c++17"])
            ]
        ),

            .target(
            name: "ObjCNifly",
            dependencies: [
                "nifly"
            ],
            cSettings: [
                .unsafeFlags(["-fmodules"])
            ],
            cxxSettings: [
                .unsafeFlags(["-fcxx-modules", "-std=c++17"])
            ]
        ),
        
            .target(
                name: "nifly",
                cxxSettings: [
                    .unsafeFlags(["-std=c++17"])
                ]
            )
    ]
)
