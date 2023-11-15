//
//  File.swift
//  
//
//  Created by Stefan Britton on 2023-11-07.
//

import SwiftUI

extension EnvironmentValues {
    var highlight: Highlight {
        get { self[HighlightKey.self] }
        set { self[HighlightKey.self] = newValue }
    }
}

private struct HighlightKey: EnvironmentKey {
    static var defaultValue: Highlight = Highlight()
}
