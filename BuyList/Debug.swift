//
//  DebugLog.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/02/11.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import Foundation

class Debug: NSObject {
    
    class func log(_ obj: Any?,
                   file:String = #file,
                   line:Int = #line,
                   function:String = #function
        ) {
        #if DEBUG
            var filename = file
            if let match = filename.range(of: "[^/]*$", options: .regularExpression) {
                filename = String(filename[match])
            }
            if let obj = obj {
                print("[File:\(filename)][Line:\(line)][Function:\(function)] : \(obj)")
            } else {
                print("[File:\(filename)][Line:\(line)][Function:\(function)]")
            }
        #endif
    }
    
}
