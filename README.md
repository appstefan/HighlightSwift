# HighlightSwift 🎨

![](https://img.shields.io/github/v/release/appstefan/highlightswift)
![](https://img.shields.io/github/license/appstefan/highlightswift)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fappstefan%2FHighlightSwift%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/appstefan/HighlightSwift)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fappstefan%2FHighlightSwift%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/appstefan/HighlightSwift)

Code Syntax Highlighting in Swift and SwiftUI

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/appstefan/HighlightSwift/assets/6455394/b95f08cd-613a-42c1-8fae-3ab62e477ebe">
  <source media="(prefers-color-scheme: light)" srcset="https://github.com/appstefan/HighlightSwift/assets/6455394/fd9c69df-1efa-47ec-a753-599346cd1ca2">
  <img alt="CodeCardDemo" src="https://github.com/appstefan/HighlightSwift/assets/6455394/fd9c69df-1efa-47ec-a753-599346cd1ca2" width=325>
</picture>

## Contents

#### `Highlight`
Converts a `String` of code into a syntax highlighted `AttributedString`
* 🔍 Automatic language detection
* 📚 Works for 50 common languages
* 🌈 Choose from 30 classic color styles
* 🧰 Built with [highlight.js](https://github.com/highlightjs/highlight.js) and `JavaScriptCore`
* 🖥️ Supported on iOS, iPadOS, macOS, and tvOS

#### `CodeText`
Drop-in replacement for the SwiftUI `Text` view
* 🔠 Supports most `Text` modifiers like `.font()`
* 🌗 Color styles sync automatically with Dark Mode

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/appstefan/HighlightSwift/assets/6455394/5021a822-39f2-40bd-b1f8-2680c2382dd3">
  <source media="(prefers-color-scheme: light)" srcset="https://github.com/appstefan/HighlightSwift/assets/6455394/5ae80ec9-d121-4f20-9cad-1ee3427e8052">
  <img alt="CodeText" src="https://github.com/appstefan/HighlightSwift/assets/6455394/5ae80ec9-d121-4f20-9cad-1ee3427e8052" width=325>
</picture>

#### `CodeCard`
Card view for iOS built with the `CodeText` view
* 💬 Displays the detected language
* 👆 Tap for style controls, double tap to reset

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/appstefan/HighlightSwift/assets/6455394/c785af2a-f6e4-4589-ae4d-34c4feaa8644">
  <source media="(prefers-color-scheme: light)" srcset="https://github.com/appstefan/HighlightSwift/assets/6455394/70dc2a01-1cf1-4378-9c88-49247e92e276">
  <img alt="CodeCard" src="https://github.com/appstefan/HighlightSwift/assets/6455394/70dc2a01-1cf1-4378-9c88-49247e92e276" width=325>
</picture>

## How to
### `Highlight`

Converting a `String` of code into a syntax highlighted `AttributedString`:
```swift
let code: String = """
def num_flat_features(self, x):
    size = x.size()[1:]
    num_features = 1
    for s in size:
        num_features *= s
    return num_features
"""

let text: AttributedString = try await Highlight.text(code).attributed
```

The full result struct includes the detected language and other details:
```swift
let result: HighlightResult = try await Highlight.text(code)

let text: AttributedString = result.attributed
let illegal: Bool = result.illegal
let language: String = result.language
let relevance: Int32 = result.relevance
let languageName: String = result.languageName
let backgroundColor: Color = result.backgroundColor
```

The `language:` parameter sets the language and prevents automatic detection:
```swift
let highlightResult = try await Highlight.text(code, language: "swift")
```

The `style:` parameter changes the highlight style and color scheme:
```swift
let highlightResult = try await Highlight.text(code, style: .dark(.solarFlare))
```

##
### `CodeText`

Creating a `CodeText` view with a `String` of code:
```swift
let code: String = """
def num_flat_features(self, x):
    size = x.size()[1:]
    num_features = 1
    for s in size:
        num_features *= s
    return num_features
"""

var body: some View {
    CodeText(code)
}
```

The attributed code string takes presedence over the font design, width and foreground color. Other `Text` modifiers like `.font()` can be used:
```swift
CodeText(code)
    .font(.system(.callout, weight: .semibold))
```

The `style:` parameter sets one of the 30 color styles. 
They each have a dark variant that the `CodeText` view automatically uses in Dark Mode.
```swift
CodeText(code, style: .github)
```

The result callback includes the detected language, background color and other details:
```swift
CodeText(code) { result in
    let illegal: Bool = result.illegal
    let language: String = result.language
    let relevance: Int32 = result.relevance
    let languageName: String = result.languageName
    let attributedText: AttributedString = result.text
    let backgroundColor: Color = result.backgroundColor
}
```

##
### `CodeCard`

Creating a `CodeCard` view with a `String` of code:
```swift
let code: String = """
def num_flat_features(self, x):
    size = x.size()[1:]
    num_features = 1
    for s in size:
        num_features *= s
    return num_features
"""

var body: some View {
    CodeCard(code)
}
```

The `style:` and `textStyle:` parameters can set the initially selected options:
```swift
CodeCard(code, style: .paraiso, textStyle: .caption)
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
