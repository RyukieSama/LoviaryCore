//
//  TableRecord.swift
//  LoviaryCore
//
//  Created by 王荣庆 on 2020/11/17.
//

import Foundation
import WCDBSwift
import Messi

public class TableLocation: MessiTable {
    public static var tableType: LoviaryDataBaseService.Tables {
        return .location
    }

    public var primaryIdentifier: Int64? {
        return identifier
    }

    /// 主键
    public var identifier: Int64? = nil
    
    /// 账户类型编码
    public var accountSubject: Int64? = nil
    
    /// 账户名称
    public var name: String? = nil
    
    /// 账户总额 真实金额的100倍
    public var amount: Int64? = nil
    
    /// 币种
    public var currencyType: String? = nil
    
    /// 账户状态 (0: 正常 1: Deleted)
    public var state: Int? = nil
    
    /// 备注
    public var memo: String? = nil
    
    /// 创建时间(毫秒)
    public var createdTime: Date? = nil
    
    /// 修改时间(毫秒)
    public var modifiedTime: Date? = nil
    
    /// 操作次数 新增一条流水 + 1
    public var operation: Int64? = nil
    
    public enum CodingKeys: String, CodingTableKey {
        public typealias Root = TableLocation
        public static let objectRelationalMapping = TableBinding(CodingKeys.self)
        
        case identifier = "FID"
        case accountSubject
        case name
        case amount
        case currencyType
        case state
        case memo
        case createdTime
        case modifiedTime
        case operation
        
        public static var columnConstraintBindings: [CodingKeys: ColumnConstraintBinding]? {
            return [
                identifier: ColumnConstraintBinding(isPrimary: true, isAutoIncrement: true),
                accountSubject: ColumnConstraintBinding(isNotNull: false),
                name: ColumnConstraintBinding(isNotNull: false),
                amount: ColumnConstraintBinding(isNotNull: true, defaultTo: 0),
                operation: ColumnConstraintBinding(isNotNull: false, defaultTo: 0),
                currencyType: ColumnConstraintBinding(isNotNull: false),
                state: ColumnConstraintBinding(isNotNull: false),
                memo: ColumnConstraintBinding(isNotNull: false),
                createdTime: ColumnConstraintBinding(isNotNull: false),
                modifiedTime: ColumnConstraintBinding(isNotNull: false)
            ]
        }
    }
}
