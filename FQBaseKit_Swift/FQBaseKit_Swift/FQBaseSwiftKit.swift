//
//  FQBaseSwiftKit.swift
//  FQBaseKit_SwiftDemo
//
//  Created by owen on 2019/8/8.
//  Copyright © 2019 owen. All rights reserved.
//

import Foundation


#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

/// FQKitError errors enum.
///
/// - jsonSerialization: JSONSerialization error.
/// - errorLoadingSound: Could not load sound error.
/// - pathNotExist: Path not exist error.
/// - pathNotAllowed: Path not allowed error.

public enum FQKitError: Error {
    case jsonSerialization
    case errorLoadingSound
    case pathNotExist
    case pathNotAllowed
}


#if canImport(UIKit)
/// Font typealias.
public typealias Font = UIFont
/// Color typealias.
public typealias Color = UIColor
#elseif canImport(AppKit)
/// Font typealias.
public typealias Font = NSFont
/// Color typealias.
public typealias Color = NSColor
#endif
