//
//  PaperImageView.swift
//  Time Paper
//
//  Created by gavinning on 2018/4/15.
//  Copyright © 2018年 gavinning. All rights reserved.
//

import Cocoa

class PaperImageView: NSImageView {
    var named: String?
    
    override func mouseDown(with event: NSEvent) {
        super.mouseDown(with: event)
    }
    
    override func mouseUp(with event: NSEvent) {
        //super.mouseUp(with: event)
        guard let name = self.named else {
            print("Not found image url.")
            return
        }
        
        self.setDesktopImage(url: name)
    }
    
    func setDesktopImage(url: String) {
        do {
            let screens = NSScreen.screens
            let wallpaper = URL.init(fileURLWithPath: url)
            
            // here we use the first screen, adapt to your case
            guard let screen = screens.first else
            {
                // handle error if no screen is available
                return
            }
            let workspace = NSWorkspace.shared
            // we get the screen's options dictionary in a variable
            guard var options = workspace.desktopImageOptions(for: screen) else {
                // handle error if no options dictionary is available for this screen
                return
            }
            
            // we add (or replace) our options in the dictionary
            // "size to fit" is NSImageScaling.scaleProportionallyUpOrDown
            // options[NSWorkspace.DesktopImageOptionKey] = NSImageScaling.scaleProportionallyUpOrDown
            options[NSWorkspace.DesktopImageOptionKey.imageScaling] = NSImageScaling.scaleProportionallyUpOrDown
            // options[NSWorkspace.DesktopImageAllowClippingKey] = true
            options[NSWorkspace.DesktopImageOptionKey.allowClipping] = true
            
            // finally we write the image using the new options
            try workspace.setDesktopImageURL(wallpaper, for: screen, options: [:])
            
            print("Set desktop image success:", named!)
        } catch {
            print("Set desktop image fail:", error.localizedDescription)
        }
    }
}
