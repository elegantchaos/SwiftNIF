
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
                publicHeadersPath: "include",
                cSettings: [
                    .unsafeFlags(["-fmodules"])
                ],
                cxxSettings: [
                    .unsafeFlags(["-fcxx-modules", "--include-directory", "Dependencies/nifly/external"])
                ]
            ),
        
            .target(
                name: "nifly",
                path: "Dependencies/nifly/",
                exclude: [
                    "tests/",
                    "cmake/nifly-config.cmake.in",
                    "CMakeLists.txt",
                    "README.md",
                    "LICENSE",
                    "src/CMakeLists.txt"
                ],
                sources: [
                    "include/",
                    "external/",
                    "src/"
                ],
                cxxSettings: [
                    .unsafeFlags(["-std=c++17", "--include-directory", "Dependencies/nifly/external"])
                ]
            )
    ]
)
