//
//  AppDelegate.swift
//  Time Paper
//
//  Created by gavinning on 2018/4/14.
//  Copyright © 2018年 gavinning. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let popover = NSPopover()
    var statusItem: NSStatusItem?
    var eventMonitor: EventMonitor?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        statusItem = NSStatusBar.system.statusItem(withLength: NSApp.mainMenu!.menuBarHeight + 4)
        
        if let button = statusItem?.button {
            button.image = NSImage.init(imageLiteralResourceName: "earth")
            button.action = #selector(togglePaper(sender:))
        }
        
        popover.contentViewController = PaperViewController.loadFromNib()
        popover.animates = false
        
        
        eventMonitor = EventMonitor(mask: [.leftMouseUp, .rightMouseUp], handler: { (event) in
            if self.popover.isShown {
                self.closePopover(event)
            }
        })
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func closePopover(_ sender: Any?) {
        popover.performClose(sender)
        eventMonitor?.stop()
    }
    
    func showPopover(_ sender: Any?) {
        if let btn = statusItem?.button {
            popover.show(relativeTo: btn.bounds, of: btn, preferredEdge: .minY)
            // 设置 MainWindow 焦点
            NSApp.mainWindow?.makeKeyAndOrderFront(sender)
            NSApp.activate(ignoringOtherApps: true)
        }
        eventMonitor?.start()
    }

    @objc func togglePaper(sender: NSStatusBarButton) {
        popover.isShown ? self.closePopover(sender) : self.showPopover(sender)
    }
}

