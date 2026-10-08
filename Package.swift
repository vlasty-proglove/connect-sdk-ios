// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "ConnectSDK",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "ConnectSDK",
            targets: ["ConnectSDKDependencies"])
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
            name: "ConnectSDKDependencies",
            dependencies: [
                "OpenSSL",
                "ZIPFoundation",
                .product(name: "ConnectSDK", package: "proglove.connectsdk"),
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
