//
//  DataBaseVersionChecker.swift
//  Ledger
//
//  Created by 王荣庆 on 2020/5/4.
//  Copyright © 2020 RyukieSama. All rights reserved.
//

import Foundation
import Swifty

public struct DataBaseVersionChecker {
    // TODO: WRQ 每次数据库变更 +1
    public static let requiredVersion: Int = 1

    public static var state: DataBaseState {
        guard let version: Int = UserDefaults.get(key: DatabaseVersionKeys.currentVersion) else {
            return .notExist
        }

        if requiredVersion == version {
            return .equal
        } else if requiredVersion > version {
            return .lower
        } else {
            return .higher
        }
    }
    
    /// 完成数据库升级后操作
    public static func afterUpgraded() {
        // TODO: WRQ 高版本恢复了低版本的数据库需要做一些处理
        updateLocalDatabase(requiredVersion)
    }
    
    /// 更新数据库版本号缓存
    /// - Parameter version: 版本号
    public static func updateLocalDatabase(_ version: Int) {
        UserDefaults.save(value: version, key: DatabaseVersionKeys.currentVersion)
    }
}

/// 本地数据库信息
private enum DatabaseVersionKeys: String, UserDefaultsKeysProtocol {
    case currentVersion
}

/// 当前数据库的状态
public enum DataBaseState {
    /// - notExist: 不存在
    case notExist
    /// - lower: 低于App要求的版本
    case lower
    /// - higher: 高于App要求的版本
    case higher
    /// - equal: 等于App要求的版本
    case equal
}
