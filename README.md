# HighlightSwift 🎨

![](https://img.shields.io/github/v/release/appstefan/highlightswift)
![](https://img.shields.io/github/license/appstefan/highlightswift)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fappstefan%2FHighlightSwift%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/appstefan/HighlightSwift)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fappstefan%2FHighlightSwift%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/appstefan/HighlightSwift)

Code Syntax Highlighting in Swift and SwiftUI
Forked from [appstefan/HighlightSwift](https://github.com/appstefan/HighlightSwift)

<picture>
  <source media="(prefers-color-scheme: light)" srcset="/Resources/codetext-light-appearance@2x.png">
  <source media="(prefers-color-scheme: dark)" srcset="/Resources/codetext-dark-appearance@2x.png">
  <img alt="CodeTextDemo" src="/Resources/codetext-light-appearance@2x.png" width=325>
</picture>

<picture>
  <source media="(prefers-color-scheme: light)" srcset="/Resources/codecard-light-appearance@2x.png">
  <source media="(prefers-color-scheme: dark)" srcset="/Resources/codecard-dark-appearance@2x.png">
  <img alt="CodeCardDemo" src="/Resources/codecard-light-appearance@2x.png" width=325>
</picture>

## Contents

### `Highlight`

Converts a `String` of code into a syntax highlighted `AttributedString`

- ⛓️ Select a language style of syntax highlight statically
- 📚 Works for 40 common languages(The original works 50 common languages)
- 🌈 Supports Only Xcode styles(The original provides 30 classic color styles)
- 🧰 Built with [highlightjs/highlight.js](https://github.com/highlightjs/highlight.js) and `JavaScriptCore`
- 🖥️ Supported on iOS, iPadOS, macOS, and tvOS

### `CodeText`

Drop-in replacement for the SwiftUI `Text` view

- 🔠 Supports most `Text` modifiers like `.font()`
- 🌗 Color styles sync automatically with Dark Mode

<picture>
  <source media="(prefers-color-scheme: light)" srcset="/Resources/codetext-light-appearance@2x.png">
  <source media="(prefers-color-scheme: dark)" srcset="/Resources/codetext-dark-appearance@2x.png">
  <img alt="CodeText" src="/Resources/codetext-light-appearance@2x.png" width=325>
</picture>

### `CodeCard`

Card view for iOS built with the `CodeText` view

- 💬 Displays the configured language
- 👆 Double tap to toggle its display

<picture>
  <source media="(prefers-color-scheme: light)" srcset="/Resources/codecard-light-appearance@2x.png">
  <source media="(prefers-color-scheme: dark)" srcset="/Resources/codecard-dark-appearance@2x.png">
  <img alt="CodeCard" src="/Resources/codecard-light-appearance@2x.png" width=325>
</picture>

## Usage

### `CodeText`

Creating a `CodeText` view with a `String` of code:

```swift
let code: String = 
  """
  import SwiftUI
    
  struct SwiftUIView: View {
    var body: some View {
      Text("Hello World!")
    }
  }
    
  struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
      SwiftUIView()
    }
  }
  """

var body: some View {
  CodeText(code)
}
```

The `language:` and `textStyle:` parameters set the syntax highlight style depending on your designating language and its font size.

```swift
CodeText(code, language: .swift, textStyle: .body)
```

<picture>
  <img alt="CodeTextWithLanguageAndTextStyle" src="/Resources/codetext-language-textstyle@2x.png" width=325>
</picture>

The result callback includes your codes with associated attributes and its background color:

```swift
CodeText(code, language: .swift) { result in
  let attributedText: AttributedString = result.attributed
  let backgroundColor: Color = result.backgroundColor
}
```

### `CodeCard`

Creating a `CodeCard` view with a `String` of code:

```swift
var body: some View {
  CodeCard(code)
}
```

The `language:` and `textStyle:` parameters set its text style as well as `CordText` does:

```swift
let code: String =
  """
  @main
  struct SwiftUILibrary: App {
    var body: some Scene {
      WindowGroup {
        Text("Hello, world!")
      }
    }
  }
  """

CodeCard(code, language: .swift, textStyle: .caption)
```

<picture>
  <img alt="CodeCardWithLanguageAndTextStyle" src="/Resources/codecard-language-textstyle@2x.png" width=325>
</picture>

## Installation

### Project

1. In Xcode, go to `File` > `Add packages...`
2. Enter `https://github.com/b150005/highlightswift` in the field and click `Add Package`

### Package

In `Package.swift` add this repository as a dependency:
```swift
dependencies: [
  .package(url: "https://github.com/b150005/highlightswift.git", from: "1.0.0")
],
targets: [
  .target(
    name: "YourPackageName",
    dependencies: ["HighlightSwift"]
  )
]
```

## License

HighlightSwift is available under the MIT license. See the [LICENSE.md](/LICENSE.md) file.

Highlight.js is available under the BSD license. See the [LICENSE.md](/Sources/HighlightSwift/HighlightJS/LICENSE.md) file.
