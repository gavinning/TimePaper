//
//  PaperViewController.swift
//  Time Paper
//
//  Created by gavinning on 2018/4/14.
//  Copyright © 2018年 gavinning. All rights reserved.
//

import Cocoa

class PaperViewController: NSViewController {
    
    class func loadFromNib() -> PaperViewController {
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        return storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "PaperViewController")) as! PaperViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Set Popover frame
        self.view.frame = Config.frame
    }
}
