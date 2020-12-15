//
//  DataBaseDataCenter.swift
//  Ledger
//
//  Created by 王荣庆 on 2020/5/5.
//  Copyright © 2020 RyukieSama. All rights reserved.
//

import Foundation
import Swifty
import WCDBSwift

public class DataBaseDataCenter {
    
    public static let shared = DataBaseDataCenter()
    
//    public func loadAccounts(callBack: @escaping SwiftyBoolCallback) throws {
//        DispatchQueue.global().async {
//            do {
//                let datas: [TableAccount] = try LoviaryDataBaseService.shared.getAll()
//                self.accounts = datas.sorted(by: { (accountA, acountB) -> Bool in
//                    return (accountA.operation ?? 0) > (acountB.operation ?? 0)
//                })
//                DispatchQueue.main.async {
//                    callBack(true)
//                }
//            }
//            catch {
//                DispatchQueue.main.async {
//                    callBack(false)
//                }
//            }
//        }
//    }
//
//    public var accounts: [TableAccount] = []
}
