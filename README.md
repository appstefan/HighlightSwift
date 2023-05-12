# HighlightSwift

Simple Syntax Highlighting for Swift and SwiftUI

## Contents

#### `Highlight`
Converts a `String` of code into a highlighted `AttributedString`
* 🔍 Automatic language detection
* 📚 Support for 36 common languages
* 🎨 Choose from 30 snazzy color styles
* 🧰 Based on [highlight.js](https://github.com/highlightjs/highlight.js) and `JavaScriptCore`

#### `CodeText`
Drop-in replacement for the standard `Text` view
* ⬜️ Clear background by default
* 🔠 Works with SwiftUI font modifier
* 🌗 Color style updates with Dark Mode

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

## Usage

#### `CodeText`

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

Use the `.font()` modifier to adjust the size and/or weight.
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

#### `CodeCard`

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

Optionally, set the inital `textStyle` and `style`.
A double tap on the card resets it to these values:
```swift
CodeCard(text, textStyle: .caption, style: .paraiso)
```

#### `Highlight`

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

Customize with a specific style and color scheme:
```swift
let style = HighlightStyle(.solarFlare, colorScheme: .dark)
let code = Highlight.code(text, style: style)
```

The result callback provides the detected language and other details:
```swift
let code = Highlight.code(text) { result in
    print("language: \(result.language)")
    print("relevance: \(result.relevance)")
    print("found illegal: \(result.illegal)")
    print("background color: \(result.backgroundColor)")
}
```

The `language` can be provided if known. This prevents automatic detection:
```swift
let code = Highlight.code(text, language: "swift")
```

## Installation

Add this git repository in Package.swift or to Package Dependencies in your project:
```swift
dependencies: [
    .package(url: "https://github.com/appstefan/highlightswift.git", from: "1.0.0")
]
```

## Author

Stefan, thrower_ranges.0d@icloud.com

## Licence

HighlightSwift is available under the MIT license. See the license file [here](/LICENSE) for more info.

Highlight.js is available under the BSD license. You can find the license file [here](/Sources/HighlightSwift/HighlightJS/LICENSE.txt).
