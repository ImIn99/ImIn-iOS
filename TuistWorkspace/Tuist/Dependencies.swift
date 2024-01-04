import ProjectDescription

let dependencies = Dependencies(
    carthage: [
//        .github(path: "Alamofire/Alamofire", requirement: .exact("5.0.4")),
    ],
    swiftPackageManager: SwiftPackageManagerDependencies(
        [
            .remote(
                url: "https://github.com/apple/swift-collections.git",
                requirement: .upToNextMajor(from: "1.0.0")
            ),
            .remote(
                url: "https://github.com/onevcat/Kingfisher.git",
                requirement: .upToNextMajor(from: "7.10.0")
            ),
        ],
        productTypes: [
            "OrderedCollections": .framework,
            "Kingfisher": .framework
        ],
        baseSettings: .settings(),
        targetSettings: [:],
        projectOptions: [:]
    ),
    platforms: [.iOS]
)
