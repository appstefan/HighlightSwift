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
* 📚 Support for 50+ common languages
* 🌈 Choose from 30 built-in color themes or use custom CSS
* 🧰 Built with [highlight.js](https://github.com/highlightjs/highlight.js) and `JavaScriptCore`
* ☑️ Complete concurrency checking enabled
* 🖥️ Works on iOS, iPadOS, macOS, and tvOS

#### `CodeText`
Display syntax highlighted code just like a standard `Text` view
* 🌗 Color theme syncs automatically with Dark Mode
* 🔠 Supports text modifiers like `.bold()` or `.font()`
* 🟩 Optional customizable `.card` style includes the theme background color

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/appstefan/HighlightSwift/assets/6455394/5021a822-39f2-40bd-b1f8-2680c2382dd3">
  <source media="(prefers-color-scheme: light)" srcset="https://github.com/appstefan/HighlightSwift/assets/6455394/5ae80ec9-d121-4f20-9cad-1ee3427e8052">
  <img alt="CodeText" src="https://github.com/appstefan/HighlightSwift/assets/6455394/5ae80ec9-d121-4f20-9cad-1ee3427e8052" width=50% height=50%>
</picture>

## Highlight

Create an instance of the `Highlight` class:
```swift
@State var highlight = Highlight()
```

Convert a `String` of code into a syntax highlighted `AttributedString`:
```swift
let attributedText = try await highlight.attributedText("print(\"Hello World\")")
```

Providing the `language:` parameter disables automatic language detection:
```swift
let attributedText = try await highlight.attributedText(code, language: "swift")
```

Set the `colors:` parameter to choose the highlight color theme.
```swift
let attributedText = try await highlight.attributedText(code, colors: .dark(.github))
```

Or use any custom CSS theme with the `.custom` option.
Refer to the highlight.js [Theme Guide](https://highlightjs.readthedocs.io/en/latest/theme-guide.html#) for more info.
```swift
let attributedText = try await highlight.attributedText(code, colors: .custom(css: someCoolCSS))
```

The `request` function returns a `HighlightResult` struct.
This result struct includes details such as the detected language along with the attributed text:
```swift
let result: HighlightResult = try await highlight.request("print(\"Hello World\")")

//   HighlightResult(
//      attributedText: "...",
//      relevance: 5,
//      language: "swift",
//      languageName: "Swift?",
//      backgroundColor: #1F2024FF,
//      hasIllegal: false,
//      isUndefined: false)
```

##
### `CodeText`

Create a `CodeText` view:
```swift
CodeText("print(\"Hello World\")")
```

The default style is `.plain` with no background or padding.
Use the customizable `.card` style to show the theme background color:
```swift
CodeText("print(\"Hello World\")")
    .codeTextStyle(.card(cornerRadius: 5))
```

Apply standard `Text` modifiers like `.font()`:
```swift
CodeText("print(\"Hello World\")")
    .font(.system(.callout, weight: .semibold))
```

Add the `.codeTextColors(_:)` modifier to set the color theme.
The built-in color themes update automatically with Dark Mode to the corresponding dark variant.
```swift
CodeText("print(\"Hello World\")")
    .codeTextColors(.github)
```

For more control, use any custom CSS theme with the `.custom` color option.
Refer to the official highlight.js [Theme Guide](https://highlightjs.readthedocs.io/en/latest/theme-guide.html#) for more info.
```swift
CodeText("print(\"Hello World\")")
    .codeTextColors(.custom(dark: .custom(css: someDarkCSS), light: .custom(css: someLightCSS)))
```

Use the `.codeTextLanguage(_:)` modifier to set a specific language and disable automatic detection:
```swift
CodeText("print(\"Hello World\")")
    .codeTextLanguage(.swift)
```

Add the `.onHighlight(_:)` modifier to get the detected language, background color and other details:
```swift
var body: some View {
    CodeText("print(\"Hello World\")")
        .onHighlight { result in
            //  ...
        }
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
