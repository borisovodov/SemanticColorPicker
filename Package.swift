// swift-tools-version: 6.0

import PackageDescription

let package: Package = Package(
    name: "SemanticColorPicker",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
        .watchOS(.v11)
    ],
    products: [
        .library(
            name: "SemanticColorPicker",
            targets: ["SemanticColorPicker"]),
    ],
    targets: [
        .target(
            name: "SemanticColorPicker",
        ),
        .testTarget(
            name: "SemanticColorPickerTests",
            dependencies: ["SemanticColorPicker"]
        ),
    ]
)
