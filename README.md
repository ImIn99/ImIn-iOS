[![Tuist badge](https://img.shields.io/badge/Powered%20by-Tuist-blue)](https://tuist.io)

# Im In - iOS App

## WIP README for ImIn iOS app

## Intro

This is the readme for the iOS application for ImIn. This will be an app to do more or less the same functionality of creating, viewing, and reserving into pick up games.

## Environment Setup

### Brew

Brew is a CLI tool to help install other packages/dependencies which is used for some tools below. More information can be found [here](https://brew.sh/) for setup.

### Tuist

This project is powered by Tuist to help manage and maintain the XCode project as more modules are added. Tuist docs, including both general information about Tuist and information about its setup, can be found [here](https://docs.tuist.io/tutorial/get-started). At the time of writing, Tuist is moving away from tuistenv to another package manager, rtx (its name changed very recently to mise). A good document to installing rtx can be found [here](https://dev.to/jdxcode/beginners-guide-to-rtx-ac4) and the official docs for mise can be found [here](https://github.com/jdx/mise). I will comment that the steps listed out that match the steps for mise alone did not work on my machine so the first document linked for rtx may be helpful. This will be updated in the future to reference only mise.

```sh
# You may need to create ~/bin directory before doing this step
curl https://rtx.jdx.dev/rtx-latest-macos-arm64 > ~/bin/rtx
chmod +x ~/bin/rtx
rtx --version
```

Add the following to your bashrc or zshrc files
```sh
export PATH="$HOME/bin:$PATH"
eval "$(rtx activate bash)"
```

### SwiftLint

SwiftLint is a tool to help maintain a coding style standard across the codebase that is controlled externally. Install the tool with `brew install swiftlint`. A detailed list of rules are found [here](https://realm.github.io/SwiftLint/rule-directory.html). This will run as a build phase after compilation and just having swiftlint installed on your machine will be sufficient, no other action is needed to be taken.

### SwiftFormat

SwiftFormat is like SwiftLint but we will utilize this tool to actually make changes for certain rules to help maintain s standard for the code base. This will be run as a pre-commit hook. Similarly run `brew install swiftformat` to install SwiftFormat on your machine. A list of rules and their definitions can be found [here](https://github.com/nicklockwood/SwiftFormat/blob/main/Rules.md). Currently, the formatted changes are not automatically added back to the staging section of changes to be committed. The script is being tested for some time but the functionality will be uncommented in `scripts/swiftformat.sh` in the future.