// swift-tools-version: 5.9
import PackageDescription

let version = "2.9.0"
// let checksum = "580042dcda21f0da33d22e493edb908b4d8688232c8c66d42052ce9b30d88df9"

let package = Package(
    name: "ProGloveConnectSDK",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "ProGloveConnectSDK",
            targets: ["ConnectSDK", "ConnectSDKDependencies"])
    ],
    dependencies: [
        .package(id: "proglove.connectsdk", from: "3.0.0"),
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.33.0"),
        .package(url: "https://github.com/workaroundgmbh/aws-sdk-ios-spm", from: "2.36.2"),
        .package(url: "https://github.com/workaroundgmbh/OpenSSL.git", from: "1.1.4"),
        .package(url: "https://github.com/weichsel/ZIPFoundation.git", from: "0.9.19"),
        .package(url: "https://github.com/NordicSemiconductor/IOS-nRF-Connect-Device-Manager", .upToNextMinor(from: "1.6.0"))
    ],
    targets: [
        .target(
            name: "ConnectSDK",
            dependencies: [
                .product(name: "ConnectSDK", package: "proglove.connectsdk")
            ]
        ),

        // .binaryTarget(
        //     name: "ConnectSDK",
        //     url: "https://dl.cloudsmith.io/QQ43WPa2Y7VlFUM3/proglove/markconnectiossdk-prod/raw/names/ConnectSDK-\(version).xcframework/versions/\(version)/ConnectSDK-\(version).xcframework.zip?accept_eula=8",
        //     checksum: checksum),
        .target(
            name: "ConnectSDKDependencies",
            dependencies: [
                "OpenSSL",
                "ZIPFoundation",
                // .target(name: "ConnectSDK"),
                // .product(name: "ConnectSDK", package: "proglove.ConnectSDK")
                .product(name: "SwiftProtobuf", package: "swift-protobuf"),
                .product(name: "iOSMcuManagerLibrary", package: "IOS-nRF-Connect-Device-Manager"),
                .product(name: "AWSCore", package: "aws-sdk-ios-spm"),
                .product(name: "AWSAuthCore", package: "aws-sdk-ios-spm"),
                .product(name: "AWSCognitoIdentityProvider", package: "aws-sdk-ios-spm"),
                .product(name: "AWSCognitoIdentityProviderASF", package: "aws-sdk-ios-spm"),
                .product(name: "AWSIoT", package: "aws-sdk-ios-spm"),
                .product(name: "AWSMobileClientXCF", package: "aws-sdk-ios-spm")],
                path: "Sources/ConnectSDKDependencies"
        )
    ]
)
