# HighlightSwift

![](https://img.shields.io/github/v/release/appstefan/highlightswift)
![](https://img.shields.io/github/license/appstefan/highlightswift)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fappstefan%2FHighlightSwift%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/appstefan/HighlightSwift)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fappstefan%2FHighlightSwift%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/appstefan/HighlightSwift)

Syntax Highlighting for Swift and SwiftUI

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/appstefan/HighlightSwift/assets/6455394/892a5be0-146e-4cb8-90ca-559c2c67452c">
  <source media="(prefers-color-scheme: light)" srcset="https://github.com/appstefan/HighlightSwift/assets/6455394/c8b3f63f-4831-4117-b302-37623e44be99">
  <img alt="CodeCardDemo" src="https://github.com/appstefan/HighlightSwift/assets/6455394/c8b3f63f-4831-4117-b302-37623e44be99" width=50% height=50%>
</picture>

## Contents

#### `Highlight`
Swift class to convert a `String` of code into a syntax highlighted `AttributedString`
* 🔍 Automatic language detection
* 📚 Support for 50+ common languages
* 🌈 Choose from 30 built-in color themes or use custom CSS
* 🧰 Built with [highlight.js](https://github.com/highlightjs/highlight.js) & `JavaScriptCore`
* ☑️ Complete concurrency checking enabled
* 🖥️ Works on iOS, iPadOS, macOS, and tvOS

#### `CodeText`
SwiftUI view to display a `String` of code with syntax highlighting
* 🌗 Color theme syncs automatically with Dark Mode
* 📜 Theme background color included with `.card` style
* 🔠 Works with `Text` modifiers like `.bold()` or `.font()`
* ⚙️ Includes modifiers to set the color theme, style & language
* 📫 Callback modifiers to get the highlight results, language & score
* 🍃 Memory efficient using an internal `Highlight` environment entry

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/appstefan/HighlightSwift/assets/6455394/5021a822-39f2-40bd-b1f8-2680c2382dd3">
  <source media="(prefers-color-scheme: light)" srcset="https://github.com/appstefan/HighlightSwift/assets/6455394/5ae80ec9-d121-4f20-9cad-1ee3427e8052">
  <img alt="CodeText" src="https://github.com/appstefan/HighlightSwift/assets/6455394/5ae80ec9-d121-4f20-9cad-1ee3427e8052" width=50% height=50%>
</picture>

## Highlight

Create an instance of `Highlight` and convert a `String` of code into a syntax highlighted `AttributedString`:
```swift
let someCode = """
    print(\"Hello World\")
    """
let highlight = Highlight()
let attributedText = try await highlight.attributedText(someCode)
```

Add the `language:` parameter to set the language and disable automatic language detection:
```swift
let attributedText = try await highlight.attributedText(someCode, language: "swift")
```

Use the `colors:` parameter to change the color theme.
```swift
let attributedText = try await highlight.attributedText(someCode, colors: .dark(.github))
```

Apply a custom CSS theme with the `.custom` option.
Refer to the highlight.js [Theme Guide](https://highlightjs.readthedocs.io/en/latest/theme-guide.html#) for details:
```swift
let someCSS = """
    .hljs {
      display: block;
      overflow-x: auto;
      padding: 0.5em;
    }
    """
let attributedText = try await highlight.attributedText(someCode, colors: .custom(css: someCSS))
```

The `request` function returns a `HighlightResult` struct.
This result struct includes details such as the detected language along with the attributed text:
```swift
let result: HighlightResult = try await highlight.request(someCode)
print(result)
```
```swift
HighlightResult(
    attributedText: "...",
    relevance: 5,
    language: "swift",
    languageName: "Swift?",
    backgroundColor: #1F2024FF,
    hasIllegal: false,
    isUndefined: false)
```

##
### `CodeText`

Create a `CodeText` view with some code:
```swift
let someCode: String = """
    print(\"Hello World\")
    """

var body: some View {
    CodeText(someCode)
}
```

The font design is always `.monospaced`. 
Other text modifiers can be applied as usual:
```swift
CodeText(someCode)
    .font(.callout)
    .fontWeight(.semibold)
```

Add the `.highlightLanguage(_:)` modifier to set the language and disable automatic detection:
```swift
CodeText(someCode)
    .highlightLanguage(.swift)
```

#### Colors
Add the `.codeTextColors(_:)` modifier to set the color theme. The built-in color themes update automatically with Dark Mode to the corresponding dark variant.
```swift
CodeText(someCode)
    .codeTextColors(.github)
```

Choose the `.custom` option to use any custom CSS color theme. Refer to the official highlight.js [Theme Guide](https://highlightjs.readthedocs.io/en/latest/theme-guide.html#) for more info.
```swift
CodeText(someCode)
    .codeTextColors(.custom(dark: .custom(css: someDarkCSS), light: .custom(css: someLightCSS)))
```

#### Styles
The default style is `.plain` without any background or padding. Some of the color themes are more legible with their corresponding background color. Add the `.codeTextStyle(_:)` modifier and choose the `.card` style to show the background:
```swift
CodeText(someCode)
    .codeTextStyle(.card)
```

The `.card` style has a few customization options, for example:
```swift
CodeText(someCode)
    .codeTextStyle(.card(cornerRadius: 0, stroke: .separator, verticalPadding: 12))
```

#### Results
Add `.onHighlightSuccess(_:)` to get the highlight results, including the detected language, relevancy score, background color and other details. Unexpected errors are unlikely but can be handled with `.onHighlightFailure(_:)` if necessary for debugging. 
```swift
CodeText(someCode)
    .onHighlightSuccess { result in
        ...
    }
    .onHighlightFailure { error in
        ...
    }
```

There is also a combined `.onHighlightResult(_:)` equivalent of the two callbacks above.
```swift
CodeText(someCode)
    .onHighlightResult { result in
        switch result {
            case .success:
                ...
            case .failure: 
                ...
        }
    }
```

It is notable that a failure to match a language to the input is actually not a highlight failure. Rather the result will have `isUndefined` set to `true` and the language will be "unknown" with a relevance score of zero.

A previously stored highlight result can be passed to the `CodeText`.
This in combination with `.onHighlightSuccess(_:)` enables persistence of the result when the view might reappear frequently, such as in a list view:
```swift
let someCode: String = """
    print(\"Hello World\")
"""

@State var result: HighlightResult?

var body: some View {
    List {
        ...
        CodeText(someCode, result: result)
            .onHighlightSuccess { result in 
                self.result = result
            }
        ...
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
    .package(url: "https://github.com/appstefan/highlightswift.git", from: "1.1")
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
