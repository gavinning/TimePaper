//
//  PopoverContentView.swift
//  Time Paper
//
//  Created by gavinning on 2018/4/14.
//  Copyright © 2018年 gavinning. All rights reserved.
//
import Cocoa

class PopoverContentView: NSView {
    var backgroundView:PopoverBackgroundView?
    
    override func viewDidMoveToWindow() {
        super.viewDidMoveToWindow()
        if let frameView = self.window?.contentView?.superview {
            if backgroundView == nil {
                backgroundView = PopoverBackgroundView(frame: frameView.bounds)
                backgroundView?.autoresizingMask = NSView.AutoresizingMask(rawValue: 1)
                frameView.addSubview(backgroundView!, positioned: NSWindow.OrderingMode.below, relativeTo: frameView)
            }
        }
    }
}

class PopoverBackgroundView:NSView {
    override func draw(_ dirtyRect: NSRect) {
        NSColor.init(red: 41/255, green: 43/255, blue: 54/255, alpha: 1).set()
        __NSRectFill(self.bounds)
    }
}
