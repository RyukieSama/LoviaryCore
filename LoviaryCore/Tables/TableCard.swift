//
//  TableRecord.swift
//  LoviaryCore
//
//  Created by 王荣庆 on 2020/11/17.
//

import Foundation
import WCDBSwift
import Messi

/// 卡片会自动填充在卡片中预设的一些项目，通过卡片创建记录的时候可以进行调整的
public class TableCard: MessiTable {
    public static var tableType: LoviaryDataBaseService.Tables {
        return .card
    }

    public var primaryIdentifier: Int64? {
        return identifier
    }

    /// 主键
    public var identifier: Int64? = nil
    
    /// 创建时间(毫秒)
    public var createdTime: Date? = nil
    
    /// 修改时间(毫秒)
    public var modifiedTime: Date? = nil
    
    /// 卡片ID
    public var cardId: Int64? = nil
    
    /// 姿势s
    public var poseIds: String? = nil
    
    /// 定位
    public var locationId: Int64? = nil
    
    /// 对象s
    public var loverIds: String? = nil
    
    /// 道具s
    public var propsIds: String? = nil
    
    /// 星标
    public var star: Bool? = nil
    
    /// 备注
    public var memo: String? = nil
    
    /// 是否自己解决
    public var bySelf: Bool? = nil
    
    /// 是否保护措施
    public var protected: Bool? = nil
    
    public enum CodingKeys: String, CodingTableKey {
        public typealias Root = TableCard
        public static let objectRelationalMapping = TableBinding(CodingKeys.self)
        
        case identifier = "FID"
        case createdTime
        case modifiedTime
        case cardId
        case poseIds
        case locationId
        case loverIds
        case propsIds
        case star
        case bySelf
        case protected
        case memo
        
        public static var columnConstraintBindings: [CodingKeys: ColumnConstraintBinding]? {
            return [
                identifier: ColumnConstraintBinding(isPrimary: true, isAutoIncrement: true),
                createdTime: ColumnConstraintBinding(isNotNull: false),
                modifiedTime: ColumnConstraintBinding(isNotNull: false),
                cardId: ColumnConstraintBinding(isNotNull: false),
                poseIds: ColumnConstraintBinding(isNotNull: false),
                locationId: ColumnConstraintBinding(isNotNull: false),
                loverIds: ColumnConstraintBinding(isNotNull: false),
                propsIds: ColumnConstraintBinding(isNotNull: false),
                star: ColumnConstraintBinding(isNotNull: false),
                bySelf: ColumnConstraintBinding(isNotNull: false),
                protected: ColumnConstraintBinding(isNotNull: false),
                memo: ColumnConstraintBinding(isNotNull: false)
            ]
        }
    }
}
