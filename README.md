# HighlightSwift 🎨

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
* 📚 Works for 50 common languages
* 🌈 Choose from 30 dark/light color styles
* 🧰 Built with [highlight.js](https://github.com/highlightjs/highlight.js) and `JavaScriptCore`
* 🖥️ Supported on iOS, iPadOS, macOS, and tvOS

#### `CodeText`
Drop-in replacement for the SwiftUI `Text` view
* ⬜️ Clear or style-colored background
* 🌗 All the color styles sync with Dark Mode
* 🔠 Supports most `Text` modifiers like `.font()`

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/appstefan/HighlightSwift/assets/6455394/5021a822-39f2-40bd-b1f8-2680c2382dd3">
  <source media="(prefers-color-scheme: light)" srcset="https://github.com/appstefan/HighlightSwift/assets/6455394/5ae80ec9-d121-4f20-9cad-1ee3427e8052">
  <img alt="CodeText" src="https://github.com/appstefan/HighlightSwift/assets/6455394/5ae80ec9-d121-4f20-9cad-1ee3427e8052" width=50% height=50%>
</picture>

#### `CodeCard`
Simple iOS card view built with the `CodeText` view
* 💬 Displays the detected language
* 👆 Tap for style controls, double tap to reset

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/appstefan/HighlightSwift/assets/6455394/c785af2a-f6e4-4589-ae4d-34c4feaa8644">
  <source media="(prefers-color-scheme: light)" srcset="https://github.com/appstefan/HighlightSwift/assets/6455394/70dc2a01-1cf1-4378-9c88-49247e92e276">
  <img alt="CodeCard" src="https://github.com/appstefan/HighlightSwift/assets/6455394/70dc2a01-1cf1-4378-9c88-49247e92e276" width=50% height=50%>
</picture>

## How to use
### `Highlight`

Convert a `String` of code into a syntax highlighted `AttributedString`:
```swift
let text: String = """
def factorial(n):
    if n == 0:
        return 1
    else:
        return n * factorial(n - 1)
"""
    
let result = try await Highlight.code(text)
let attributedText: AttributedString = result.text
```

The result also includes the detected language and other details:
```swift
...
let illegal: Bool = result.illegal
let language: String = result.language
let relevance: Int32 = result.relevance
let languageName: String = result.languageName
let backgroundColor: Color = result.backgroundColor
```

Use the `language:` parameter to skip automatic detection:
```swift
let highlightResult = try await Highlight.code(text, language: "swift")
```

Use the `style:` parameter to set the highlight style and color scheme:
```swift
let highlightResult = try await Highlight.code(text, style: .dark(.solarFlare))
```
##
### `CodeText`
Create a `CodeText` view with a `String` of code:
```swift
let text: String = """
def factorial(n):
    if n == 0:
        return 1
    else:
        return n * factorial(n - 1)
"""

var body: some View {
    CodeText(text)
}
```

Some `Text` modifiers like `.font()` work. `.fontDesign()` and `.fontWidth()` have no effect:
```swift
CodeText(text)
    .font(.system(.callout, weight: .semibold))
```

Use the `style:` and `showBackground:` parameters to adjust the appearance:
```swift
CodeText(text, style: .atomOne, showBackground: true)
    .font(.body)
```

The result callback includes the detected language and other details:
```swift
CodeText(text) { result in
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

Create a `CodeCard` with a `String` of code:
```swift
let text: String = """
def factorial(n):
    if n == 0:
        return 1
    else:
        return n * factorial(n - 1)
"""

var body: some View {
    CodeCard(text)
}
```

Use the `style:` and `textStyle:` parameters to adjust the initial appearance:
```swift
CodeCard(text, style: .paraiso, textStyle: .caption)
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
