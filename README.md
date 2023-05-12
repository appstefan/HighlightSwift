# HighlightSwift

Syntax Highlighting for Swift and SwiftUI

## Contents

#### `Highlight`
Converts a `String` of code into a highlighted `AttributedString`
* 🔍 Automatic language detection
* 📚 Support for 36 common languages
* 🎨 Choose from 30 snazzy color styles
* 🧰 Powered by [highlight.js](https://github.com/highlightjs/highlight.js) and `JavaScriptCore`

#### `CodeText`
Drop-in replacement for a `Text` view with syntax highlighting
* ⬜️ Clear background by default
* 🌗 Color style syncs with Dark Mode
* 🔠 Based on `Text`, so modifiers like `.font()` work

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/appstefan/HighlightSwift/assets/6455394/f8ec4cf4-80bd-49de-9ba4-f67effc4a9e4">
  <source media="(prefers-color-scheme: light)" srcset="https://github.com/appstefan/HighlightSwift/assets/6455394/c5404300-5117-45af-9e12-7ae19d25c630">
  <img alt="CodeCard" src="https://github.com/appstefan/HighlightSwift/assets/6455394/c5404300-5117-45af-9e12-7ae19d25c630" width=42% height=42%>
</picture>

#### `CodeCard`
App-ready interactive card built around the `CodeText` view
* 🎨 Tap for controls
* 🔄 Double tap to reset
* 🕵🏻‍♂️ Displays detected language

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/appstefan/HighlightSwift/assets/6455394/b6fa5521-58f1-46ff-a3c3-9a4129ad3c7f">
  <source media="(prefers-color-scheme: light)" srcset="https://github.com/appstefan/HighlightSwift/assets/6455394/db4d5102-590e-40fc-8d73-3eb226f336b9">
  <img alt="CodeCard" src="https://github.com/appstefan/HighlightSwift/assets/6455394/db4d5102-590e-40fc-8d73-3eb226f336b9" width=42% height=42%>
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

Use the standard `.font()` modifier to adjust the font size and/or weight.
The design is set internally to `.monospaced`:
```swift
CodeText(text)
    .font(.system(.callout, weight: .semibold))
```

Optionally, use the `style` and `showBackground` parameters to adjust the appearance:
```swift
CodeText(text, style: .paraiso, showBackground: true)
    .font(.body)
```

The result callback provides the detected language and other details:
```swift
CodeText(text) { result in
    print("text: \(result.text)")
    print("illegal: \(result.illegal)")
    print("language: \(result.language)")
    print("relevance: \(result.relevance)")
    print("background: \(result.backgroundColor)")
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

Optionally, provide the inital `textStyle` and `style`.
Double tapping on the card resets it to these values:
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
let code: AttributedString = Highlight.code(text)
```

Providing a specific `language` bypasses automatic detection:
```swift
let code = Highlight.code(text, language: "swift")
```

Customize with a specific style and color scheme:
```swift
let style = HighlightStyle(.solarFlare, colorScheme: .dark)
let code = Highlight.code(text, style: style)
```

The result callback provides the detected language and other details:
```swift
let code = Highlight.code(text) { result in
    print("illegal: \(result.illegal)")
    print("language: \(result.language)")
    print("relevance: \(result.relevance)")
    print("background color: \(result.backgroundColor)")
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

## Licence

HighlightSwift is available under the MIT license. See the license file [here](/LICENSE).

Highlight.js is available under the BSD license. See the license file [here](/Sources/HighlightSwift/HighlightJS/LICENSE.txt).
