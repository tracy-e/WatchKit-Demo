//
//  TimelineInterfaceController.swift
//  V2EX
//
//  Created by TracyYih on 15/5/19.
//  Copyright (c) 2015年 esoftmobile.com. All rights reserved.
//

import WatchKit
import Foundation

let kPageSize = 10
class TimelineInterfaceController: WKInterfaceController, LoadMoreCellDelegate {
    
    @IBOutlet var activityIndicator: WKInterfaceGroup!
    @IBOutlet var table: WKInterfaceTable!
    var issues = [Issue]()
    var currentPageIndex = 0
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        if let json = context as? [String: String] {
            self.setTitle(json["title"])
            loadData(json["api"]!)
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    // MARK: - 
    func loadData(urlString: String) {
        if let URL = NSURL(string: urlString) {
            NSURLSession.sharedSession().dataTaskWithURL(URL, completionHandler: { [weak self] (data, _, error) -> Void in
                do {
                    if let strongSelf = self, data = data, issues = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(rawValue: 0)) as? [AnyObject] where error == nil {
                        strongSelf.issues = issues.map { Issue(fromDictionary: $0 as! NSDictionary) }
                        strongSelf.configureTable()
                        strongSelf.activityIndicator.setHidden(true)
                    }
                } catch { }
            })?.resume()
        }
    }
    
    func configureTable() {
        let issueCount = issues.count
        let lastCount = issueCount - kPageSize * currentPageIndex
        let isFullPage = (lastCount > kPageSize)
        let pageCount = isFullPage ? kPageSize : lastCount
        let startIndex = kPageSize * currentPageIndex
        let endIndex = startIndex + pageCount
        
        if currentPageIndex == 0 {
            table.setNumberOfRows(pageCount, withRowType: "TimelineCell")
        } else {
            table.insertRowsAtIndexes(NSIndexSet(indexesInRange: NSMakeRange(startIndex, pageCount)), withRowType: "TimelineCell")
        }
        if isFullPage {
            table.insertRowsAtIndexes(NSIndexSet(index: endIndex), withRowType: "LoadMoreCell")
            if let loadMoreCell = table.rowControllerAtIndex(endIndex) as? LoadMoreCell {
                loadMoreCell.delegate = self
            }
        }
        
        for i in startIndex..<endIndex {
            if let cell = table.rowControllerAtIndex(i) as? TimelineCell {
                cell.issue = issues[i]
            }
        }
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        self.pushControllerWithName("IssueDetail", context: issues[rowIndex])
    }
    
    // MARK: - LoadMoreCellDelegate Methods
    func loadMoreButtonClicked(cell: LoadMoreCell) {
        // remove load more cell
        let lastRow = table.numberOfRows - 1
        table.removeRowsAtIndexes(NSIndexSet(index: lastRow))
        
        currentPageIndex++
        configureTable()
    }
}
