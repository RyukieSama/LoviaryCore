//
//  TableRecord.swift
//  LoviaryCore
//
//  Created by 王荣庆 on 2020/11/17.
//

import Foundation
import WCDBSwift
import Messi

public class TableProps: MessiTable {
    public static var tableType: LoviaryDataBaseService.Tables {
        return .props
    }

    public var primaryIdentifier: Int64? {
        return identifier
    }

    /// 主键
    public var identifier: Int64? = nil
    
    /// 名称
    public var name: String? = nil
    
    /// 图片
    public var icon: String? = nil
    
    /// 备注
    public var memo: String? = nil
    
    /// 创建时间(毫秒)
    public var createdTime: Date? = nil
    
    /// 修改时间(毫秒)
    public var modifiedTime: Date? = nil
    
    /// 操作次数 新增一条流水 + 1
    public var operation: Int64? = nil
    
    public enum CodingKeys: String, CodingTableKey {
        public typealias Root = TableProps
        public static let objectRelationalMapping = TableBinding(CodingKeys.self)
        
        case identifier = "FID"
        case name
        case icon
        case memo
        case createdTime
        case modifiedTime
        case operation
        
        public static var columnConstraintBindings: [CodingKeys: ColumnConstraintBinding]? {
            return [
                identifier: ColumnConstraintBinding(isPrimary: true, isAutoIncrement: true),
                name: ColumnConstraintBinding(isNotNull: false),
                icon: ColumnConstraintBinding(isNotNull: false),
                memo: ColumnConstraintBinding(isNotNull: false),
                createdTime: ColumnConstraintBinding(isNotNull: false),
                modifiedTime: ColumnConstraintBinding(isNotNull: false),
                operation: ColumnConstraintBinding(isNotNull: false, defaultTo: 0)
            ]
        }
    }
}
