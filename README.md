# HighlightSwift 🎨

Syntax Highlighting for Swift and SwiftUI

## Contents

#### `Highlight`
Converts a `String` of code into a highlighted `AttributedString`
* 🔍 Automatic language detection
* 📚 Support for 36 common languages
* 🌈 Choose from 30 snazzy color styles
* 🧰 Powered by [highlight.js](https://github.com/highlightjs/highlight.js) and `JavaScriptCore`

#### `CodeText`
Drop-in replacement for a SwiftUI `Text` view with syntax highlighting
* ⬜️ Clear or color style background
* 🌗 Color style syncs with environment `ColorScheme`
* 🔠 Based on `Text` so modifiers like `.font()` still work

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/appstefan/HighlightSwift/assets/6455394/5021a822-39f2-40bd-b1f8-2680c2382dd3">
  <source media="(prefers-color-scheme: light)" srcset="https://github.com/appstefan/HighlightSwift/assets/6455394/5ae80ec9-d121-4f20-9cad-1ee3427e8052">
  <img alt="CodeText" src="https://github.com/appstefan/HighlightSwift/assets/6455394/5ae80ec9-d121-4f20-9cad-1ee3427e8052" width=42% height=42%>
</picture>

#### `CodeCard`
App-ready interactive card built around the `CodeText` view
* 💬 Displays detected language
* 👆 Tap for style controls, double tap to reset

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/appstefan/HighlightSwift/assets/6455394/c785af2a-f6e4-4589-ae4d-34c4feaa8644">
  <source media="(prefers-color-scheme: light)" srcset="https://github.com/appstefan/HighlightSwift/assets/6455394/70dc2a01-1cf1-4378-9c88-49247e92e276">
  <img alt="CodeCard" src="https://github.com/appstefan/HighlightSwift/assets/6455394/70dc2a01-1cf1-4378-9c88-49247e92e276" width=42% height=42%>
</picture>

## How to use
### `CodeText`
Create a `CodeText` view with a `String` of code:
```swift
let text: String = """
    def factorial(n):
        if n == 0:
            return 1
        else:
            return n * factorial(n-1)
    """

var body: some View {
    CodeText(text)
}
```

Use a `.font()` modifier as usual to adjust the font size and/or weight.
The design will always remain `.monospaced`:
```swift
CodeText(text)
    .font(.system(.callout, weight: .semibold))
```

Use the `style:` and `showBackground:` parameters to adjust the appearance:
```swift
CodeText(text, style: .paraiso, showBackground: true)
    .font(.body)
```

The result callback includes the detected language and other details:
```swift
CodeText(text) { result in
    let text: AttributedString = result.text
    let illegal: Bool = result.illegal
    let language: String = result.language
    let relevance: Int32 = result.relevance
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
            return n * factorial(n-1)
    """

var body: some View {
    CodeCard(text)
}
```

Use the `textStyle:` and `style:` parameters to adjust the initial appearance:
```swift
CodeCard(text, textStyle: .caption, style: .paraiso)
```

##
### `Highlight`

Convert a `String` of code into a syntax highlighted `AttributedString`:
```swift
let text: String = """
    def factorial(n):
        if n == 0:
            return 1
        else:
            return n * factorial(n-1)
    """
    
let result = try await Highlight.code(text)
let text: AttributedString = result.text
```

The result also includes the detected language and other details:
```swift
...
let illegal: Bool = result.illegal
let language: String = result.language
let relevance: Int32 = result.relevance
let backgroundColor: Color = result.backgroundColor
```

Use the `language:` parameter to skip automatic detection:
```swift
let highlightResult = try await Highlight.code(text, language: "swift")
```

Use the `style:` parameter specific style and color scheme:
```swift
let highlightStyle = HighlightStyle(.solarFlare, colorScheme: .dark)
let highlightResult = try await Highlight.code(text, style: highlightStyle)
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

## Licence

HighlightSwift is available under the MIT license. See the license file [here](/LICENSE).

Highlight.js is available under the BSD license. See the license file [here](/Sources/HighlightSwift/HighlightJS/LICENSE.txt).
