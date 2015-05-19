//
//  Cell.swift
//  V2EX
//
//  Created by TracyYih on 15/5/19.
//  Copyright (c) 2015年 esoftmobile.com. All rights reserved.
//

import WatchKit

class TimelineCell: NSObject {
    @IBOutlet var avatar: WKInterfaceImage!
    @IBOutlet var usernameLabel: WKInterfaceLabel!
    @IBOutlet var titleLabel: WKInterfaceLabel!
    @IBOutlet var nodeLabel: WKInterfaceLabel!
    @IBOutlet var repliesLabel: WKInterfaceLabel!
    @IBOutlet var timeLabel: WKInterfaceLabel!
    
    var issue: Issue! {
        didSet {
            if let URL = NSURL(string: "http:\(issue.member.avatarMini)") {
                avatar.kf_setImageWithURL(URL, placeholderImage: UIImage(named: "avator"))
            }
            usernameLabel.setText(issue.member.username)
            titleLabel.setText(issue.title)
            nodeLabel.setText(issue.node.title)
            repliesLabel.setText("\(issue.replies)")
            timeLabel.setText(Utils.dateBefore(issue.lastModified))
        }
    }
}
