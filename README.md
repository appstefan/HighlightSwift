# HighlightSwift 🎨

![](https://img.shields.io/github/v/release/appstefan/highlightswift)
![](https://img.shields.io/github/license/appstefan/highlightswift)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fappstefan%2FHighlightSwift%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/appstefan/HighlightSwift)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fappstefan%2FHighlightSwift%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/appstefan/HighlightSwift)

Syntax Highlighting in Swift and SwiftUI

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/appstefan/HighlightSwift/assets/6455394/892a5be0-146e-4cb8-90ca-559c2c67452c">
  <source media="(prefers-color-scheme: light)" srcset="https://github.com/appstefan/HighlightSwift/assets/6455394/c8b3f63f-4831-4117-b302-37623e44be99">
  <img alt="CodeCardDemo" src="https://github.com/appstefan/HighlightSwift/assets/6455394/c8b3f63f-4831-4117-b302-37623e44be99" width=50% height=50%>
</picture>

## Contents

#### `Highlight`
Convert any `String` of code into a syntax highlighted `AttributedString`
* 🔍 Automatic language detection
* 📚 Works with 50 common languages
* 🌈 Choose from 30 classic color themes
* 🧰 Built with [highlight.js](https://github.com/highlightjs/highlight.js) and `JavaScriptCore`
* 🖥️ Supported on iOS, iPadOS, macOS, and tvOS

#### `CodeText`
Drop-in replacement for the SwiftUI `Text` view
* 🔠 Supports most `Text` modifiers like `.font()`
* 🌗 Color theme syncs automatically with Dark Mode

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/appstefan/HighlightSwift/assets/6455394/5021a822-39f2-40bd-b1f8-2680c2382dd3">
  <source media="(prefers-color-scheme: light)" srcset="https://github.com/appstefan/HighlightSwift/assets/6455394/5ae80ec9-d121-4f20-9cad-1ee3427e8052">
  <img alt="CodeText" src="https://github.com/appstefan/HighlightSwift/assets/6455394/5ae80ec9-d121-4f20-9cad-1ee3427e8052" width=50% height=50%>
</picture>

## How to
### `Highlight`

Highlight is available as an environment value:
```swift
@Environment(\.highlight) var highlight
```

Alternatively, create a new instance.
By default the previous 50 highlights are cached. Use 0 to completely disable cacheing.
```swift
let highlight = Highlight(cacheLimit: 50)
```

Convert a plain `String` of code into a syntax highlighted `AttributedString`:
```swift
let attributedText = try await highlight.attributed("print(\"Hello World\")")
```

The `language:` parameter sets a specific language, disabling automatic detection.
```swift
let attributedText = try await highlight.attributed(code, language: "swift")
```

The `colors:` parameter sets the highlight theme and the system color scheme:
```swift
let attributedText = try await highlight.attributed(code, colors: .dark(.solarFlare))
```

The full request function provides the detected language and other details:
```swift
let result: HighlightResult = try await highlight.request("print(\"Hello World\")")

//   HighlightResult(
//      attributedText: "...",
//      relevance: 5,
//      language: "swift",
//      languageName: "Swift?",
//      backgroundColor: #1F2024FF,
//      hasIllegal: false,
//      isUndefined: false
//  )
```

##
### `CodeText`

Create a `CodeText` view:
```swift
CodeText("print(\"Hello World\")")
```

Typical `Text` modifiers like `.font()` can be applied:
```swift
CodeText("print(\"Hello World\")")
    .font(.system(.callout, weight: .semibold))
```

The `.codeTextTheme(_:)` modifier sets one of the 30 built-in color themes.
Each theme has a dark color scheme variant that is used automatically in Dark Mode:
```swift
CodeText("print(\"Hello World\")")
    .codeTextTheme(.github)
```

The `.codeTextLanguage(_:)` modifier sets a specific language, disabling automatic detection:
```swift
CodeText("print(\"Hello World\")")
    .codeTextLanguage(.swift)
```

The optional result binding provides the detected language, background color and other details:
```swift
@Binding var result: HighlightResult?

var body: some View {
    CodeText("print(\"Hello World\")", result: $result)
}
```

## Installation

### Project

1. In Xcode, go to `File` > `Add packages...`
2. Enter `https://github.com/appstefan/highlightswift` in the field and click `Add Package`

### Package

In `Package.swift` add this repository as a dependency:
```swift
dependencies: [
    .package(url: "https://github.com/appstefan/highlightswift.git", from: "1.0.0")
],
targets: [
    .target(
        name: "YourPackageName",
        dependencies: ["HighlightSwift"]
    )
]
```

## Author

Stefan, thrower_ranges.0d@icloud.com

## License

HighlightSwift is available under the MIT license. See the [LICENSE.md](/LICENSE.md) file.

Highlight.js is available under the BSD license. See the [LICENSE.md](/Sources/HighlightSwift/HighlightJS/LICENSE.md) file.
