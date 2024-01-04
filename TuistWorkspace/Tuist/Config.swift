import ProjectDescription

let config = Config(
    plugins: [
        .local(path: .relativeToManifest("../../Plugins/ImIn")),
//        .git(
//            url: "https://github.com/tuist/tuist-plugin-lint.git",
//            tag: "0.3.0"
//        ),
    ]
)
