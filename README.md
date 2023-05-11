# HighlightSwift

Code syntax highlighting for SwiftUI using Highlight.js

## Features

🔍 Automatic language detection
📚 Supports 36 common languages
🎨 Includes 30 syntax color styles
🔠 Works with SwiftUI font modifier
🌗 Styles sync with system Dark Mode
🧰 Based on highlight.js and `JavaScriptCore`

## Includes

### ⚙️ `Highlight` core Swift class
Converts any code `String` to a highlighted `AttributedString`

### 📄 `CodeText` basic SwiftUI view
Drop-in replacement for standard `Text` with sensible defaults for highlighting

### 📺 `CodeCard` fancy SwiftUI view
Showcase for `CodeText` on iOS with detected language and style controls

## Usage

### CodeCard

Create a card with some code text:
```swift
let text: String = "@State var isOn: Bool = true"

var body: some View {
    CodeCard(text)
}
```

Optionally provide the inital style state properties:
```swift
CodeCard(text, style: .paraiso, textStyle: .caption)
```

### CodeText

Use like a standard `Text` view, with modifiers such as `.font()`.
```swift
let text: String = "@State var isOn: Bool = true"

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

### Highlight

Convert a code `String` into a syntax highlighted `AttributedString`:
```swift
let text: String = "@State var isOn: Bool = true"
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
    ...,
    .package(url: "https://github.com/appstefan/highlightswift.git", from: "1.0.0")
]
```

## Author

Stefan Britton, thrower_ranges.0d@icloud.com

## Licence

HighlightSwift is available under the MIT license. See the LICENSE file for more info.

Highlight.js is available under the BSD license. You can find the license file here.
