//
//  DataBaseManager.swift
//  Ledger
//
//  Created by 王荣庆 on 2020/5/4.
//  Copyright © 2020 RyukieSama. All rights reserved.
//

import Foundation
import Messi

public struct DatabaseManager {
    public static let shared = DatabaseManager()
    
    @discardableResult
    public func validDatabase() throws -> Database {
        do {
            let database = try DatabaseService.provider.fetchValidDatabase(of: .records) {
                if let isExist = try? $0.isTableExists(TableRecord.name), isExist {
                    return true
                }
                
                return false
            }
            
            return database
        } catch {
            return try initialDatabase()
        }
    }

    @discardableResult
    public func initialDatabase() throws -> Database {
        let database = DatabaseService.provider.fetchOrCreateDatabase(of: .records)
        try createTables(for: database)
        DataBaseVersionChecker.afterUpgraded()
        return database
    }
    
    public func checkLocalDatabase() throws {
        LoviaryDataBaseService.shared.getValidDatabase()
        switch DataBaseVersionChecker.state {
        case .notExist:
            try initialDatabase()
        case .lower:
            try upgradeDatabase()
        default:
            break
        }
    }
    
    // MARK: - UpgradeDataBase
    public func upgradeDatabase() throws {
        // TODO: WRQ upgradeDatabase
        do {
            let database = try validDatabase()
            try createTables(for: database)
            DataBaseVersionChecker.afterUpgraded()
        } catch let error as MessiError {
//            Log(error.errorDescription!)
        }
    }
    
    /// CreateDataBaseTables
    /// - Parameter database: DataBase
    /// - Throws: Error
    private func createTables(for database: Database) throws {
        try database.create(table: TableCard.name, of: TableCard.self)
        try database.create(table: TableLocation.name, of: TableLocation.self)
        try database.create(table: TableLover.name, of: TableLover.self)
        try database.create(table: TablePose.name, of: TablePose.self)
        try database.create(table: TableProps.name, of: TableProps.self)
        try database.create(table: TableRecord.name, of: TableRecord.self)
    }
}

extension DatabaseManager {

}
