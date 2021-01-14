//
//  LoviaryDataBaseService.swift
//  Ledger
//
//  Created by 王荣庆 on 2020/5/4.
//  Copyright © 2020 RyukieSama. All rights reserved.
//

import Foundation
import Messi

public class LoviaryDataBaseService: Messible {
    public static var shared: LoviaryDataBaseService {
        return LoviaryDataBaseService()
    }

    public init() {
        database = Database(withFileURL: DatabaseService.records.fileURL)
    }

    public var database: Database

    public enum Tables: String {
        /// 记录表
        case record = "t_record"
        /// n姿势：体位
        case pose = "t_pose"
        /// 地点：地理位置
        case location = "t_location"
        /// 具体位置：主卧 次卧 厨房 客厅
//        case place = "t_place"
        /// n元素：cosplay SM 等
//        case element = "t_element"
        /// n对象：不一定是人哦。。。
        case lover = "t_lover"
        /// n道具: 杯等。。。
        case props = "t_props"
        /// 卡片：基础模版
        case card = "t_card"
    }

    public func getValidDatabase() {
        database = Database(withFileURL: DatabaseService.records.fileURL)
    }
}
