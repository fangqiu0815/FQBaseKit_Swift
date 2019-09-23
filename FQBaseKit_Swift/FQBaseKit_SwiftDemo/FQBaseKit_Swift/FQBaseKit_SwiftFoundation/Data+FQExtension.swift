//
//  Data+FQExtension.swift
//  FQBaseKit_SwiftDemo
//
//  Created by owen on 2019/8/8.
//  Copyright © 2019 owen. All rights reserved.
//

import Foundation

// MARK: - Data extension

public extension Data {
    // MARK: - Functions
    
    /// Convert self to a UTF8 String.
    func utf8() -> String? {
        return String(data: self, encoding: .utf8)
    }
    
    /// Convert self to a ASCII String.
    func ascii() -> String? {
        return String(data: self, encoding: .ascii)
    }
    
    /// Convert self UUID to String.
    func readableUUID() -> String {
        return description.trimmingCharacters(in: CharacterSet(charactersIn: "<>")).replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "-", with: "")
    }
}
