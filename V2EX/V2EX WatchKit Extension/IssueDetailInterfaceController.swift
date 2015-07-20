//
//  IssueDetailInterfaceController.swift
//  V2EX
//
//  Created by TracyYih on 15/5/19.
//  Copyright (c) 2015年 esoftmobile.com. All rights reserved.
//

import WatchKit
import Foundation

class IssueDetailInterfaceController: WKInterfaceController {

    var issue: Issue!
    @IBOutlet var avatar: WKInterfaceImage!
    @IBOutlet var usernameLabel: WKInterfaceLabel!
    @IBOutlet var titleLabel: WKInterfaceLabel!
    @IBOutlet var contentLabel: WKInterfaceLabel!
    @IBOutlet var nodeLabel: WKInterfaceLabel!
    @IBOutlet var timeLabel: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        if let issue = context as? Issue {
            self.issue = issue
            if let URL = NSURL(string: "http:\(issue.member.avatarMini)") {
                Utils.loadImage(URL, completionHandler: { [weak self] (image) -> Void in
                    if let strongSelf = self, image = image {
                        strongSelf.avatar.setImage(image)
                    }
                })
            }
            usernameLabel.setText(issue.member.username)
            titleLabel.setText(issue.title)
            contentLabel.setText(issue.content)
            nodeLabel.setText(issue.node.title)
            timeLabel.setText(Utils.dateBefore(issue.lastModified))
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        self.updateUserActivity("com.esoftmobile.v2ex.handoff", userInfo: nil, webpageURL: NSURL(string: self.issue.url))
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        self.invalidateUserActivity()
    }

}
