//
//  SettingViewController.swift
//  CodePathTipCalculator
//
//  Created by admin on 1/3/16.
//  Copyright © 2016 Hanaa. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet weak var tipControl2: UISegmentedControl!
    
    
    @IBAction func editingTipControl2(sender: UISegmentedControl) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setInteger(sender.selectedSegmentIndex, forKey: "defaultTip")
        defaults.synchronize()
        
    }
    
    
    @IBAction func Done(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTip = defaults.integerForKey("defaultTip")
        print("got default tip: \(defaultTip)")
        switch defaultTip {
        case 0...2:
            tipControl2.selectedSegmentIndex = defaultTip
        default:
            tipControl2.selectedSegmentIndex = 0
        }
    }
}
