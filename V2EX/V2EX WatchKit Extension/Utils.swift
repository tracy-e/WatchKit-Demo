//
//  Utils.swift
//  V2EX
//
//  Created by TracyYih on 15/5/19.
//  Copyright (c) 2015年 esoftmobile.com. All rights reserved.
//

import UIKit

class Utils: NSObject {
   
    class func dateBefore(timeInterval: Int) -> String {
        let currentDate = Int(NSDate().timeIntervalSince1970)
        let interval = currentDate - timeInterval
        if interval / 60 == 0 {
            return "刚刚"
        } else if contains(0..<60, interval / 60) {
            return "\(interval / 60) 分钟前"
        } else if contains(0..<24, interval / 3600) {
            return "\(interval / 3600) 小时前"
        } else {
            return "\(interval / 86400) 天前"
        }
    }
}
