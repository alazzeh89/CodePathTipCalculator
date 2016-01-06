//
//  ViewController.swift
//  CodePathTipCalculator
//
//  Created by admin on 1/3/16.
//  Copyright © 2016 Hanaa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    var timer = NSTimer()
    
    func updateTime() {
    let dateFormatter = NSDateFormatter()
    let timeFormatter = NSDateFormatter()
    
    dateFormatter.dateStyle = .MediumStyle
    timeFormatter.timeStyle = .MediumStyle
    
    dateLabel.text = dateFormatter.stringFromDate(NSDate())
    timeLabel.text = timeFormatter.stringFromDate(NSDate())
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        updateTip()
    }
    
    func updateTip() {
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount : Double = (billField.text! as NSString).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = String(format: "$%.3f", tip)
        totalLabel.text = String(format: "$%.3f", total)
    }
    
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTip = defaults.integerForKey("default_tip")
        print("got default tip: \(defaultTip)")
        switch defaultTip {
        case 0...2:
            tipControl.selectedSegmentIndex = defaultTip
        default:
            tipControl.selectedSegmentIndex = 0
        }
        updateTip()
    }

    
}

