// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AmplitudeUnified",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v7),
        .visionOS(.v1),
    ],
    products: [
        .library(
            name: "AmplitudeUnified",
            targets: ["AmplitudeUnified"]),
    ],
    dependencies: [
        .package(url: "https://github.com/amplitude/experiment-ios-client.git", branch: "unified"),
        .package(url: "https://github.com/amplitude/AmplitudeSessionReplay-iOS.git", branch: "unified"),
        .package(url: "https://github.com/amplitude/Amplitude-Swift.git", branch: "unified"),
    ],
    targets: [
        .target(
            name: "AmplitudeUnified",
            dependencies: [
                .product(name: "AmplitudeSwift",
                         package: "Amplitude-Swift"),
                .product(name: "AmplitudeSessionReplay",
                         package: "AmplitudeSessionReplay-iOS",
                         condition: .when(platforms: [
                            .iOS,
                         ])),
                .product(name: "Experiment",
                         package: "experiment-ios-client"),
            ],
            resources: [
                .process("PrivacyInfo.xcprivacy"),
            ]
        ),
        .testTarget(
            name: "AmplitudeUnifiedTests",
            dependencies: [
                .target(name: "AmplitudeUnified"),
            ]
        ),
    ]
)
