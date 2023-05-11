# HighlightSwift

Code syntax highlighting for SwiftUI using Highlight.js

## Package Contents
 
#### `Highlight`
Converts a code `String` into a highlighted `AttributedString`
- 🔍 Automatic language detection
- 📚 Supports 36 common languages
- 🎨 Includes 30 syntax color styles
- 🧰 Based on highlight.js and `JavaScriptCore`

#### `CodeText`
Drop-in replacement for SwiftUI `Text` view
- 🔠 Works with SwiftUI font modifier
- 🌗 Automatically changes style with Dark Mode

#### `CodeCard`
Showcase for `CodeText` with detected language display and style controls

## Usage

#### `CodeCard`

Create with some code text:
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

Optionally, provide the inital style state properties.
Double tapping on the card resets it to these.
```swift
CodeCard(text, textStyle: .caption, style: .paraiso)
```

#### `CodeText`

Use like a standard `Text` view, with modifiers such as `.font()`.
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
        .font(.body)
}
```

Include the style property and/or set `showBackground` to adjust the appearance.
```swift
CodeText(text, style: .paraiso, showBackground: true)
    .font(.body)
```

The detected language is available along with other details in the `HighlightResult` callback:
```swift
CodeText(text) { result in
    print("language: \(result.language)")
    print("relevance: \(result.relevance)")
    print("found illegal: \(result.illegal)")
    print("background color: \(result.backgroundColor)")
}
```

#### `Highlight`

Convert a code `String` into a syntax highlighted `AttributedString`:
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

The detected language is available in a callback:
```swift
let code = Highlight.code(text) { result in 
    print("language: \(result.language)")
    print("relevance: \(result.relevance)")
    print("found illegal: \(result.illegal)")
    print("background color: \(result.backgroundColor)")
}
```

The `language` parameter can be provided, preventing any automatic detection.
```swift
let code: AttributedString = Highlight.code(text, language: "swift")
```

## Installation

Add this git repository in Package.swift or to Package Dependencies in your project:
```swift
dependencies: [
    .package(url: "https://github.com/appstefan/highlightswift.git", from: "1.0.0")
]
```

## Author

Stefan Britton, thrower_ranges.0d@icloud.com

## Licence

HighlightSwift is available under the MIT license. See the LICENSE file for more info.

Highlight.js is available under the BSD license. You can find the license file here.
