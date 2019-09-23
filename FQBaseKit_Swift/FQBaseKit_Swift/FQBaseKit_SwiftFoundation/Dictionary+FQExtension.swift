//
//  Dictionary+FQExtension.swift
//  FQBaseKit_SwiftDemo
//
//  Created by owen on 2019/8/8.
//  Copyright © 2019 owen. All rights reserved.
//

import Foundation

// MARK: - Dictionary extension

public extension Dictionary {
    // MARK: - Functions
    
    /// Append a Value for a given Key in the Dictionary.
    /// If the Key already exist it will be ovrewritten.
    ///
    /// - Parameters:
    ///   - value: Value to be added.
    ///   - key: Key to be added.
    mutating func append(_ value: Value, forKey key: Key) {
        self[key] = value
    }
}



