//
//  String+FQExtension.swift
//  FQBaseKit_SwiftDemo
//
//  Created by owen on 2019/7/19.
//  Copyright © 2019 owen. All rights reserved.
//

import Foundation
import CommonCrypto
import UIKit

// MARK: - String extension

public extension String {
    //  MARK: - 简易手机号码 验证 只验证手机号11位和第一位是1
    func fq_isMobilePhoneForSimpleVerificationPhone(_ phoneNumber: String) -> Bool {
        if phoneNumber.count == 0 {
            return false
        }
        let regex = "^1\\d{10}$"
        let pred = NSPredicate(format: "SELF MATCHES %@", regex)
        let isMatch = pred.evaluate(with: phoneNumber)
        if isMatch{
            return false
        }else{
            return true
        }
        
    }
    
    //  MARK: - 判断当前字符是否包含在限制字符串内
    func fq_shouldChangeCharaetersWithLimitString(_ limitString: String) -> Bool {
        let cs = CharacterSet(charactersIn: limitString).inverted
        let filtered = components(separatedBy: cs).joined(separator: "")
        return self == filtered
        
    }
    
    //  MARK: - 限制字符串的长度
    func fq_limitStringLengthWithLength(_ length: Int) -> String? {
        if self.count > length {
            return (self as? NSString)?.substring(to: length)
        }
        return nil
    }
    
    //  MARK: - 获取时间戳
    static func fq_getTimestamp() -> String? {
        let date = Date(timeIntervalSinceNow: 0)
        let timeInterval = TimeInterval(date.timeIntervalSince1970 * 1000)
        let timeString = String(format: "%.0f", timeInterval)
        return timeString
    }
    
    //  MARK: - 是否是url地址
    func isURLValid() -> Bool {
        let regEx = "((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))?.+"
        let predicate = NSPredicate(format: "SELF MATCHES %@", argumentArray: [regEx])
        return predicate.evaluate(with: self)
    }
    
    //  MARK: - md5加密
    func md5Encry(strs:String) ->String!{
        let str = strs.cString(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(strs.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        CC_MD5(str!, strLen, result)
        let retStr = NSMutableString()
        for i in 0 ..< digestLen {
            retStr.appendFormat("%02x", result[i])
        }
        result.deallocate()
        return String(format: retStr as String)
    }
    
    // MARK: - 密码校验
    func passwordVerify() -> Bool {
        let regEx = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", argumentArray: [regEx])
        return predicate.evaluate(with: self)
        
    }
    
    // MARK: - 校验字符串是否为空
    func isBlankString(_ string: String) -> Bool {
        if nil == string  {
            return true
        }
        if (string is NSNull) {
            return true
        }
        if string.trimmingCharacters(in: CharacterSet.whitespaces).count == 0 {
            return true
        }
        if (string == "(null)") {
            return true
        }
        if (string == "<null>") {
            return true
        }
        return false
    }
    
    // MARK: - 计算字符串尺寸
    func size(with font: UIFont?, maxSize: CGSize , strs:String) -> CGSize {
        var dict: [NSAttributedString.Key : UIFont?]? = nil
        if let font = font {
            dict = [
                NSAttributedString.Key.font: font
            ]
        }
        let textSize = strs.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: dict, context: nil).size
        return textSize
    }
    
    // MARK: - 是否是邮箱
    func isEmail() -> Bool {
        let emailRegEx: String = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let regExPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        return regExPredicate.evaluate(with: lowercased())
    }
    
    /// Gets the individual characters and puts them in an array as Strings.
    var array: [String] {
        return description.map { String($0) }
    }
    
    /// Returns the Float value
    var floatValue: Float {
        return NSString(string: self).floatValue
    }
    
    /// Returns the Int value
    var intValue: Int {
        return Int(NSString(string: self).intValue)
    }
    
    /// Convert self to a Data.
    var dataValue: Data? {
        return data(using: .utf8)
    }
    
    /// Encoded string to Base64.
    var base64encoded: String {
        guard let data: Data = data(using: .utf8) else {
            return ""
        }
        return data.base64EncodedString()
    }
    
    /// Decoded Base64 to string.
    var base64decoded: String {
        guard let data = Data(base64Encoded: String(self), options: .ignoreUnknownCharacters), let dataString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else {
            return ""
        }
        return String(describing: dataString)
    }
    
    /// Encode self to an encoded url string.
    var urlEncoded: String? {
        return addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)
    }
    
    /// Returns the localized string from self.
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    /// Convert the String to a NSNumber.
    var numberValue: NSNumber? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.number(from: self)
    }
    
    // MARK: - Functions
    
    /// Get the character at a given index.
    ///
    /// - Parameter index: The index.
    /// - Returns: Returns the character at a given index, starts from 0.
    func character(at index: Int) -> Character {
        return self[self.index(startIndex, offsetBy: index)]
    }
    
    /// Returns a new string containing the characters of the String from the one at a given index to the end.
    ///
    /// - Parameter index: The index.
    /// - Returns: Returns the substring from index.
    func substring(from index: Int) -> String {
        return String(self[self.index(startIndex, offsetBy: index)...])
    }
    
    /// Creates a substring from the given character.
    ///
    /// - Parameter character: The character.
    /// - Returns: Returns the substring from character.
    func substring(from character: Character) -> String {
        let index = self.index(of: character)
        guard index > -1 else {
            return ""
        }
        return substring(from: index + 1)
    }
    
    /// Returns a new string containing the characters of the String up to, but not including, the one at a given index.
    ///
    /// - Parameter index: The index.
    /// - Returns: Returns the substring to index.
    func substring(to index: Int) -> String {
        guard index <= count else {
            return ""
        }
        return String(self[..<self.index(startIndex, offsetBy: index)])
    }
    
    /// Creates a substring to the given character.
    ///
    /// - Parameter character: The character.
    /// - Returns: Returns the substring to character.
    func substring(to character: Character) -> String {
        let index: Int = self.index(of: character)
        guard index > -1 else {
            return ""
        }
        return substring(to: index)
    }
    
    /// Creates a substring with a given range.
    ///
    /// - Parameter range: The range.
    /// - Returns: Returns the string between the range.
    func substring(with range: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(startIndex, offsetBy: range.upperBound)
        
        return String(self[start..<end])
    }
    
    /// Creates a substring with a given range.
    ///
    /// - Parameter range: The range.
    /// - Returns: Returns the string between the range.
    func substring(with range: CountableClosedRange<Int>) -> String {
        return substring(with: Range(uncheckedBounds: (lower: range.lowerBound, upper: range.upperBound + 1)))
    }
    
    /// Returns the index of the given character.
    ///
    /// - Parameter character: The character to search.
    /// - Returns: Returns the index of the given character, -1 if not found.
    func index(of character: Character) -> Int {
        guard let index: Index = firstIndex(of: character) else {
            return -1
        }
        
        return distance(from: startIndex, to: index)
    }
    
    /// Check if self has the given substring in case-sensitiv or case-insensitive.
    ///
    /// - Parameters:
    ///   - string: The substring to be searched.
    ///   - caseSensitive: If the search has to be case-sensitive or not.
    /// - Returns: Returns true if founded, otherwise false.
    func range(of string: String, caseSensitive: Bool = true) -> Bool {
        return caseSensitive ? (range(of: string) != nil) : (lowercased().range(of: string.lowercased()) != nil)
    }
    
    /// Check if self has the given substring in case-sensitiv or case-insensitive.
    ///
    /// - Parameters:
    ///   - string: The substring to be searched.
    ///   - caseSensitive: If the search has to be case-sensitive or not.
    /// - Returns: Returns true if founded, otherwise false.
    func has(_ string: String, caseSensitive: Bool = true) -> Bool {
        return range(of: string, caseSensitive: caseSensitive)
    }
    
    /// Returns the number of occurrences of a String into
    ///
    /// - Parameter string: String of occurrences.
    /// - Returns: Returns the number of occurrences of a String into
    func occurrences(of string: String, caseSensitive: Bool = true) -> Int {
        var string = string
        if !caseSensitive {
            string = string.lowercased()
        }
        return lowercased().components(separatedBy: string).count - 1
    }
    
    /// Conver self to a capitalized string.
    /// Example: "This is a Test" will return "This is a test" and "this is a test" will return "This is a test".
    ///
    /// - Returns: Returns the capitalized sentence string.
    func sentenceCapitalizedString() -> String {
        guard !isEmpty else {
            return ""
        }
        let uppercase: String = substring(to: 1).uppercased()
        let lowercase: String = substring(from: 1).lowercased()
        
        return uppercase + lowercase
    }
    
    /// Returns the query parameter string.
    ///
    /// - Parameter parameter: Parameter to be searched.
    /// - Returns: Returns the query parameter string.
    func queryStringParameter(parameter: String) -> String? {
        guard let url = URLComponents(string: self) else {
            return nil
        }
        
        return url.queryItems?.first { $0.name == parameter }?.value
    }
    
    /// Converts the query to a dictionary of parameters.
    ///
    /// - Returns: Returns the dictionary of parameters.
    func queryDictionary() -> [String: String] {
        var queryStrings: [String: String] = [:]
        for pair in self.components(separatedBy: "&") {
            let key = pair.components(separatedBy: "=")[0]
            let value = pair.components(separatedBy: "=")[1].replacingOccurrences(of: "+", with: " ").removingPercentEncoding ?? ""
            
            queryStrings[key] = value
        }
        return queryStrings
    }
    
    
    /// Returns the last path component.
    var lastPathComponent: String {
        return NSString(string: self).lastPathComponent
    }
    
    /// Returns the path extension.
    var pathExtension: String {
        return NSString(string: self).pathExtension
    }
    
    /// Delete the last path component.
    var deletingLastPathComponent: String {
        return NSString(string: self).deletingLastPathComponent
    }
    
    /// Delete the path extension.
    var deletingPathExtension: String {
        return NSString(string: self).deletingPathExtension
    }
    
    /// Returns an array of path components.
    var pathComponents: [String] {
        return NSString(string: self).pathComponents
    }
    
    /// Appends a path component to the string.
    ///
    /// - Parameter path: Path component to append.
    /// - Returns: Returns all the string.
    func appendingPathComponent(_ path: String) -> String {
        let string = NSString(string: self)
        
        return string.appendingPathComponent(path)
    }
    
    /// Appends a path extension to the string.
    ///
    /// - Parameter ext: Extension to append.
    /// - Returns: Returns all the string.
    func appendingPathExtension(_ ext: String) -> String? {
        let nsSt = NSString(string: self)
        
        return nsSt.appendingPathExtension(ext)
    }
}

