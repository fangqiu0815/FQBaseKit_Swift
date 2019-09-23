//
//  Array+FQExtension.swift
//  FQBaseKit_SwiftDemo
//
//  Created by owen on 2019/8/8.
//  Copyright © 2019 owen. All rights reserved.
//

import Foundation

// MARK: - Array extension

public extension Array {
    // MARK: - 数组是否为空
    var isNotEmpty: Bool {
        return !isEmpty
    }
    
    
    // MARK: - 数组安全移除某组
    mutating func remove(_ object: Element) {
        var array: [String] = []
        for index in self {
            array.append("\(index)")
        }
        let index = array.firstIndex(of: "\(object)")
        if let index = index {
            remove(at: index)
        }
    }
    
    // MARK: - 数组安全调用某组数据
    func safeObject(at index: Int) -> Element? {
        guard !isEmpty, count > index else {
            return nil
        }
        
        return self[index]
    }
    
    /// Move object from an index to another.
    ///
    /// - Parameters:
    ///   - fromIndex: The start index.
    ///   - toIndex: The end index.
    mutating func swap(from fromIndex: Int, to toIndex: Int) {
        if toIndex != fromIndex {
            guard let object: Element = safeObject(at: fromIndex) else {
                return
            }
            remove(at: fromIndex)
            
            if toIndex >= count {
                append(object)
            } else {
                insert(object, at: toIndex)
            }
        }
    }
    
}


