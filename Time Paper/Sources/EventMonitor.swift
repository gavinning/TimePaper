//
//  EventMonitor.swift
//  Time Paper
//
//  Created by gavinning on 2018/4/14.
//  Copyright © 2018年 gavinning. All rights reserved.
//

import Cocoa

class EventMonitor {
    private var monitor: Any?
    private var mask: NSEvent.EventTypeMask
    private var handler: (NSEvent?) -> ()
    
    init(mask: NSEvent.EventTypeMask, handler: @escaping (NSEvent?) -> ()) {
        self.mask = mask
        self.handler = handler
    }
    
    deinit {
        stop()
    }
    
    func start() {
        monitor = NSEvent.addGlobalMonitorForEvents(matching: mask, handler: handler)
    }
    
    func stop() {
        if monitor != nil {
            NSEvent.removeMonitor(monitor!)
            monitor = nil
        }
    }

}
