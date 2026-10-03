#!/bin/zsh
set -euo pipefail
cd "${0:A:h:h}"
export DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer
verify_dir=$(mktemp -d /tmp/markiii-verification.XXXXXX)
# Previews are built by xcodebuild; this standalone harness renders the same view code.
sed '/^#Preview/,$d' ironman-markIII/ContentView.swift > "$verify_dir/ContentView.swift"
sources=(ironman-markIII/**/*.swift)
sources=("${(@)sources:#*MyApp.swift}")
sources=("${(@)sources:#*ContentView.swift}")
xcrun swiftc -parse-as-library -module-cache-path /tmp/markiii-module-cache -o "$verify_dir/verify" "${sources[@]}" "$verify_dir/ContentView.swift" Scripts/VerifyMarkIII.swift
"$verify_dir/verify"
