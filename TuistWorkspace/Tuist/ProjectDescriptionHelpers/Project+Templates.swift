import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {
    static var swiftLintScript: TargetScript {
        TargetScript.post(
            path: .relativeToRoot("../scripts/swiftlint.sh"),
            name: "Run SwiftLint",
            basedOnDependencyAnalysis: false
        )
    }

    /// Helper function to create the Project for this ExampleApp
    public static func app(name: String, destinations: Destinations, additionalTargets: [String]) -> Project {
        var targets = makeAppTargets(
            name: name,
            destinations: destinations,
            dependencies: additionalTargets
                .map { TargetDependency.target(name: $0) }
//                .appending(.external(name: "OrderedCollections"))
        )
        targets += additionalTargets.flatMap({ makeFrameworkTargets(name: $0, destinations: destinations) })
        return Project(name: name,
                       organizationName: "tuist.io",
                       targets: targets)
    }

    // MARK: - Private

    /// Helper function to create a framework target and an associated unit test target
    private static func makeFrameworkTargets(name: String, destinations: Destinations) -> [Target] {
        let sources = Target(
            name: name,
            destinations: destinations,
            product: .framework,
            bundleId: "io.tuist.\(name)",
            infoPlist: .default,
            sources: ["Targets/\(name)/Sources/**"],
            resources: [],
            dependencies: [
                .external(name: "OrderedCollections"),
                .external(name: "Kingfisher"),
            ]
        )
        let tests = Target(
            name: "\(name)Tests",
            destinations: destinations,
            product: .unitTests,
            bundleId: "io.tuist.\(name)Tests",
            infoPlist: .default,
            sources: ["Targets/\(name)/Tests/**"],
            resources: [],
            dependencies: [.target(name: name)]
        )
        return [sources, tests]
    }

    /// Helper function to create the application target and the unit test target.
    private static func makeAppTargets(name: String, destinations: Destinations, dependencies: [TargetDependency]) -> [Target] {
        let infoPlist: [String: Plist.Value] = [
            "CFBundleShortVersionString": "1.0",
            "CFBundleVersion": "1",
            "UILaunchStoryboardName": "LaunchScreen"
            ]

        let mainTarget = Target(
            name: name,
            destinations: destinations,
            product: .app,
            bundleId: "io.tuist.\(name)",
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Targets/\(name)/Sources/**"],
            resources: ["Targets/\(name)/Resources/**"],
            scripts: [
                swiftLintScript,
            ],
            dependencies: dependencies
        )

        let testTarget = Target(
            name: "\(name)Tests",
            destinations: destinations,
            product: .unitTests,
            bundleId: "io.tuist.\(name)Tests",
            infoPlist: .default,
            sources: ["Targets/\(name)/Tests/**"],
            dependencies: [
                .target(name: "\(name)")
        ])
        return [mainTarget, testTarget]
    }
}
