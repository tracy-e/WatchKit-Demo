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
        } else if (0..<60).contains(interval / 60) {
            return "\(interval / 60) 分钟前"
        } else if (0..<24).contains(interval / 3600) {
            return "\(interval / 3600) 小时前"
        } else {
            return "\(interval / 86400) 天前"
        }
    }
    
    static let imageCache = NSCache()
    static let imageQueue = dispatch_queue_create("com.esoftmobile.e2ex.imagequeue", DISPATCH_QUEUE_CONCURRENT)
    
    class func loadImage(imageURL: NSURL, completionHandler:(UIImage?) -> Void) {
        if let image = imageCache.objectForKey(imageURL) as? UIImage {
            return completionHandler(image)
        }
        
        dispatch_async(imageQueue) {
            guard let imageData = NSData(contentsOfURL: imageURL) else {
                return dispatch_async(dispatch_get_main_queue()) {
                    completionHandler(nil)
                }
            }
            guard let image = UIImage(data: imageData) else {
                return dispatch_async(dispatch_get_main_queue()) {
                    completionHandler(nil)
                }
            }
            dispatch_async(dispatch_get_main_queue()) {
                imageCache.setObject(image, forKey: imageURL)
                completionHandler(image)
            }
        }
    }
}
