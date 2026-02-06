// swift-tools-version: 6.2

import PackageDescription

let package: Package = Package(
    name: "SemanticColorPicker",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .watchOS(.v26)
    ],
    products: [
        .library(
            name: "SemanticColorPicker",
            targets: ["SemanticColorPicker"]),
    ],
    targets: [
        .target(
            name: "SemanticColorPicker",
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "SemanticColorPickerTests",
            dependencies: ["SemanticColorPicker"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
