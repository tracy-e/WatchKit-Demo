//
//  InterfaceController.swift
//  Calculator WatchKit Extension
//
//  Created by TracyYih on 15/5/6.
//  Copyright (c) 2015年 esoftmobile.com. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    enum OperationType: Int {
        case None, Plus, Minus, Multiply, Divide
    }
    
    
    @IBOutlet var resultLabel: WKInterfaceLabel!
    var displayText: String = ""
    var operation: OperationType = .None
    var previousNumber: String?
    
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

    // MARK: - Private Methods
    
    private func pressedNumber(number: Int) {
        if operation != .None && previousNumber == nil {
            previousNumber = displayText
            displayText = "\(number)"
            resultLabel.setText(displayText)
        } else {
            displayText.write("\(number)")
            resultLabel.setText(displayText)
        }
    }
    
    private func pressedOperation(operation: OperationType) {
        if self.operation == .None {
            self.operation = operation
        } else {
            result()
            self.operation = operation
        }
    }
    
    // MARK: - Actions
    
    @IBAction func zero() {
        if let number = displayText.toInt() where number == 0 {
            println("do nothing")
        } else {
            pressedNumber(0)
        }
    }
    
    @IBAction func one() {
        pressedNumber(1)
    }
    
    @IBAction func two() {
        pressedNumber(2)
    }
    
    @IBAction func three() {
        pressedNumber(3)
    }
    
    @IBAction func four() {
        pressedNumber(4)
    }
    
    @IBAction func five() {
        pressedNumber(5)
    }
    
    @IBAction func six() {
        pressedNumber(6)
    }
    
    @IBAction func seven() {
        pressedNumber(7)
    }
    
    @IBAction func eight() {
        pressedNumber(8)
    }
    
    @IBAction func nine() {
        pressedNumber(9)
    }
    
    // MARK: -
    
    @IBAction func plus() {
        pressedOperation(.Plus)
    }
    
    @IBAction func minus() {
        pressedOperation(.Minus)
    }
    
    @IBAction func multiply() {
        pressedOperation(.Multiply)
    }
    
    @IBAction func divide() {
        pressedOperation(.Divide)
    }
    
    // MARK: -
    
    @IBAction func point() {
        if displayText == "" {
            displayText.write("0.")
            resultLabel.setText(displayText)
        } else if find(displayText, ".") == nil {
            displayText.write(".")
            resultLabel.setText(displayText)
        }
    }
    
    
    @IBAction func result() {
        if let previous = previousNumber {
            let previousNumber = NSString(string: previous).doubleValue
            let displayNumber = NSString(string: displayText).doubleValue
            switch operation {
            case .Plus:
                displayText = NSNumber(double: previousNumber + displayNumber).stringValue
            case .Minus:
                displayText = NSNumber(double: previousNumber - displayNumber).stringValue
            case .Multiply:
                displayText = NSNumber(double: previousNumber * displayNumber).stringValue
            case .Divide:
                displayText = NSNumber(double: previousNumber / displayNumber).stringValue
            default:
                println("do nothing")
            }
            resultLabel.setText(displayText)
            self.previousNumber = nil
            operation = .None
        }
    }
    
    // MARK: - Menu Actions
    
    @IBAction func delete() {
        let length = displayText.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)
        if length > 0 {
            displayText = dropLast(displayText)
            if displayText == "" {
                resultLabel.setText("0")
            } else {
                resultLabel.setText(displayText)
            }
        }
    }
    
    @IBAction func clear() {
        displayText = ""
        previousNumber = nil
        resultLabel.setText("0")
        operation = .None
    }
    
    
}
