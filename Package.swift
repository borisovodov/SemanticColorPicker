// swift-tools-version: 6.0

import PackageDescription

let package: Package = Package(
    name: "SemanticColorPicker",
    defaultLocalization: "en",
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
            // resources: [.process("Resources")],
        ),
        .testTarget(
            name: "SemanticColorPickerTests",
            dependencies: ["SemanticColorPicker"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
