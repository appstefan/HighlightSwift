//
//  PlatformFont.swift
//  HighlightSwift
//
//  Created by Benjamin Sage on 10/28/24.
//

import Foundation

#if canImport(UIKit)
import UIKit
public typealias PlatformFont = UIFont
#elseif canImport(AppKit)
import AppKit
public typealias PlatformFont = NSFont
#endif
