//
//  DataBaseTypeConvertable.swift
//  Ledger
//
//  Created by 王荣庆 on 2020/5/5.
//  Copyright © 2020 RyukieSama. All rights reserved.
//

import Foundation

public protocol DataBaseTypeConvertable: RawRepresentable {}

extension DataBaseTypeConvertable where Self.RawValue == Int64 {
    public var value: Int64 {
        return rawValue
    }
    
    /// 从数据库转换出类型
    /// - Parameter dataBase: 数据库里存的值
    /// - Returns: 类型
    static func type(from dataBase: Int64?) -> Self? {
        return Self(rawValue: dataBase ?? 0)
    }
}

extension DataBaseTypeConvertable where Self.RawValue == String {
    var value: String {
        return rawValue
    }
    
    /// 从数据库转换出类型
    /// - Parameter dataBase: 数据库里存的值
    /// - Returns: 类型
    static func type(from dataBase: String?) -> Self? {
        return Self(rawValue: dataBase ?? "")
    }
}
