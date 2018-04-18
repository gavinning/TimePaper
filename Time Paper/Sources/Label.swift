//
//  Label.swift
//  Time Paper
//
//  Created by gavinning on 2018/4/15.
//  Copyright © 2018年 gavinning. All rights reserved.
//

import Cocoa

public class Label: NSTextField {
    public var text: String? {
        didSet {
            if let text = text {
                self.stringValue = text
            }
        }
    }
    
    public override init(frame: NSRect) {
        super.init(frame: frame)

        self.isBezeled = false
        self.isEditable = false
        self.isSelectable = false
    }
    
    public convenience init(text: String?) {
        self.init(frame: NSRect())
        self.text = text
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
