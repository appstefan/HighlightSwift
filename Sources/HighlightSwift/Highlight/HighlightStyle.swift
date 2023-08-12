import SwiftUI

public enum HighlightStyle {
  case light
  case dark
  
  init(colorScheme: ColorScheme) {
    switch colorScheme {
      case .light:
        self = .light
      case .dark:
        self = .dark
      @unknown default:
        self = .light
    }
  }
  
  var selectorsText: String {
    switch self {
      case .light:
        "pre code.hljs{display:block;overflow-x:auto;padding:1em}code.hljs{padding:3px 5px}.hljs{color:#000}.xml .hljs-meta{color:silver}.hljs-comment,.hljs-quote{color:#007400}.hljs-attribute,.hljs-keyword,.hljs-literal,.hljs-name,.hljs-selector-tag,.hljs-tag{color:#aa0d91}.hljs-template-variable,.hljs-variable{color:#3f6e74}.hljs-code,.hljs-meta .hljs-string,.hljs-string{color:#c41a16}.hljs-link,.hljs-regexp{color:#0e0eff}.hljs-bullet,.hljs-number,.hljs-symbol,.hljs-title{color:#1c00cf}.hljs-meta,.hljs-section{color:#643820}.hljs-built_in,.hljs-class .hljs-title,.hljs-params,.hljs-title.class_,.hljs-type{color:#5c2699}.hljs-attr{color:#836c28}.hljs-subst{color:#000}.hljs-formula{font-style:italic}.hljs-selector-class,.hljs-selector-id{color:#9b703f}.hljs-doctag,.hljs-strong{font-weight:700}.hljs-emphasis{font-style:italic}"
      case .dark:
        ".hljs{display:block;overflow-x:auto;padding:0.5em;color:white}.xml .hljs-meta{color:#6C7986}.hljs-comment,.hljs-quote{color:#6C7986}.hljs-tag,.hljs-attribute,.hljs-keyword,.hljs-selector-tag,.hljs-literal,.hljs-name{color:#FC5FA3}.hljs-variable,.hljs-template-variable{color:#FC5FA3}.hljs-code,.hljs-string,.hljs-meta-string{color:#FC6A5D}.hljs-regexp,.hljs-link{color:#5482FF}.hljs-title,.hljs-symbol,.hljs-bullet,.hljs-number{color:#41A1C0}.hljs-section,.hljs-meta{color:#FC5FA3}.hljs-class .hljs-title,.hljs-type,.hljs-built_in,.hljs-builtin-name,.hljs-params{color:#D0A8FF}.hljs-attr{color:#BF8555}.hljs-subst{color:#FFF}.hljs-formula{font-style:italic}.hljs-selector-id,.hljs-selector-class{color:#9b703f}.hljs-doctag,.hljs-strong{font-weight:bold}.hljs-emphasis{font-style:italic}"
    }
  }
  
  var backgroundHex: StaticString {
    switch self {
      case .light:
        "#fff"
      case .dark:
        "#1f2024"
    }
  }
}
