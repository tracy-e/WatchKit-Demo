//
//  InterfaceController.swift
//  V2EX WatchKit Extension
//
//  Created by TracyYih on 15/5/19.
//  Copyright (c) 2015年 esoftmobile.com. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    // MARK: - Actions
    
    @IBAction func latestIssues() {
        self.pushControllerWithName("Timeline", context: [ "title": "时间线", "api": "https://www.v2ex.com/api/topics/latest.json" ])
    }
    
    @IBAction func hotIssues() {
        self.pushControllerWithName("Timeline", context: [ "title": "热门推荐", "api": "https://www.v2ex.com/api/topics/hot.json" ])
    }
}
