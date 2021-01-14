//
//  TableRecord.swift
//  LoviaryCore
//
//  Created by 王荣庆 on 2020/11/17.
//

import Foundation
import WCDBSwift
import Messi

public class LoverService {
    /// 保存Lover
    /// - Parameter lover: Lover
    /// - Throws: 异常
    public static func save(lover: TableLover) throws {
        try LoviaryDataBaseService.shared.insert(objects: lover)
    }
}
