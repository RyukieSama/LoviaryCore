//
//  DatabaseService.swift
//  Ledger
//
//  Created by 王荣庆 on 2020/5/4.
//  Copyright © 2020 RyukieSama. All rights reserved.
//

import Foundation
import Messi

public enum DatabaseService: DatabaseTargetType, DatabaseServiceable {
    case records

    public var path: String {
        switch self {
        case .records:
            return "Loviary/"
        }
    }
    
    public var tag: Int {
        switch self {
        case .records:
            return 100
        }
    }
    
    public var name: String {
        switch self {
        case .records:
            return "loviary.db"
        }
    }
    
    var groupURL: URL? {
        return FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.Ryukie.Sama.Loviary")
    }
    
    public var baseURL: URL {
        guard let group = groupURL else {
            return document
        }
        return group
    }
    
    public var oldDBBaseURL: URL {
        var urll = document
        urll.appendPathComponent(path)
        urll.appendPathComponent(name)
        return urll
    }
    
}
