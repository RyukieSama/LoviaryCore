//
//  TableRecord.swift
//  LoviaryCore
//
//  Created by 王荣庆 on 2020/11/17.
//

import Foundation
import WCDBSwift
import Messi

public class TableLover: MessiTable {
    public static var tableType: LoviaryDataBaseService.Tables {
        return .lover
    }

    public var primaryIdentifier: Int64? {
        return identifier
    }

    /// 主键
    public var identifier: Int64? = nil
    
    /// 名字
    public var name: String? = nil
    
    /// 性别：0其他 1男 2女 3双 4男to女 5女to男
    public var gender: Int64? = nil
    
    /// 偏好：性别s
    public var genderLike: String? = nil
    
    /// 定位
    public var locationId: Int64? = nil
    
    /// 备注
    public var memo: String? = nil
    
    /// 创建时间(毫秒)
    public var createdTime: Date? = nil
    
    /// 修改时间(毫秒)
    public var modifiedTime: Date? = nil
    
    /// 星标
    public var star: Bool? = nil
    
    public enum CodingKeys: String, CodingTableKey {
        public typealias Root = TableLover
        public static let objectRelationalMapping = TableBinding(CodingKeys.self)
        
        case identifier = "FID"
        case name
        case gender
        case genderLike
        case locationId
        case memo
        case createdTime
        case modifiedTime
        case star
        
        public static var columnConstraintBindings: [CodingKeys: ColumnConstraintBinding]? {
            return [
                identifier: ColumnConstraintBinding(isPrimary: true, isAutoIncrement: true),
                name: ColumnConstraintBinding(isNotNull: false),
                gender: ColumnConstraintBinding(isNotNull: false),
                genderLike: ColumnConstraintBinding(isNotNull: false),
                locationId: ColumnConstraintBinding(isNotNull: false),
                memo: ColumnConstraintBinding(isNotNull: false),
                createdTime: ColumnConstraintBinding(isNotNull: false),
                modifiedTime: ColumnConstraintBinding(isNotNull: false),
                star: ColumnConstraintBinding(isNotNull: false)
            ]
        }
    }
}
