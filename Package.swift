
// swift-tools-version:5.5

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
    dependencies: [
        .package(url: "https://github.com/elegantchaos/XCTestExtensions", from: "1.4.6")
    ],
    targets: [
        .testTarget(
            name: "SwiftNiflyTests",
            dependencies: [
                "SwiftNifly",
                "XCTestExtensions"
            ],
            resources: [
                .process("Resources")
            ]
        ),
        
        .target(
            name: "SwiftNifly",
            dependencies: [
                "cnifly"
            ],
            cSettings: [
                .unsafeFlags(["-fmodules"])
            ],
            cxxSettings: [
                .unsafeFlags(["-fcxx-modules", "-std=c++17"])
            ]
        ),
        
            .target(
                name: "cnifly",
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
