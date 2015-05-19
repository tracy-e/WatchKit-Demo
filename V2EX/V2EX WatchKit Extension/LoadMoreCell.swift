//
//  LoadMoreCell.swift
//  V2EX
//
//  Created by TracyYih on 15/5/19.
//  Copyright (c) 2015年 esoftmobile.com. All rights reserved.
//

import UIKit

protocol LoadMoreCellDelegate: NSObjectProtocol {
    func loadMoreButtonClicked(cell: LoadMoreCell)
}

class LoadMoreCell: NSObject {
   
    weak var delegate: LoadMoreCellDelegate?
    
    @IBAction func buttonPressed() {
        self.delegate?.loadMoreButtonClicked(self)
    }
}
