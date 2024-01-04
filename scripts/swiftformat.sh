#!/bin/bash

if [[ "$(uname -m)" == arm64 ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi

if which swiftformat > /dev/null; then
    for file in $(git diff --name-only --cached)
    do
        # check if file is in correct location to apply swiftformatting
        if [[ "$file" == *"TuistWorkspace/Targets"* ]] && \
        [[ "$file" == *".swift" ]]; then
            swiftformat $file
            # Now add the file back to the staging section to be committed.
            # Uncomment if we need users to review changes before adding them
            #   back to be added in a separate commit.
            #$(git add $file)
        fi
    done
else
  echo "warning: SwiftFormat not installed, download from https://github.com/nicklockwood/SwiftFormat"
fi