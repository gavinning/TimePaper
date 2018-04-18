//
//  Papers.swift
//  Time Paper
//
//  Created by gavinning on 2018/4/15.
//  Copyright © 2018年 gavinning. All rights reserved.
//

import Cocoa

public class Papers: NSScrollView {
    public var title: String?
    public var delegate: PapersDelegate?
    public var dataSource: PapersDataSource?

    public override init(frame: NSRect) {
        super.init(frame: frame)
        
        self.documentView = NSView()
        self.layer?.borderWidth = 0
        self.drawsBackground = false
        self.verticalScrollElasticity = .allowed
        self.contentView.drawsBackground = true
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func create(title: String?) -> Label {
        let label = Label(text: title)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = NSColor.init(red: 41/255, green: 43/255, blue: 54/255, alpha: 1)
        label.font = NSFont.systemFont(ofSize: 18)
        label.textColor = .white
        label.sizeToFit()
        return label
    }
    
    private func create(imageView name: PaperImageView?) -> PaperImageView {
        let imageView = PaperImageView(image: NSImage(imageLiteralResourceName: "1"))
        imageView.named = "/Users/gavinning/Desktop/1.jpg"
        
        // 添加约束前确定已经把需要布局的子view添加到父view上了
        // 一定要禁止将Autoresizing Mask转换为约束
        // 要把子view的约束加在父view上
        // 因为iOS中原点在左上角所以使用offset时注意right和bottom用负数
        // subview.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
    
        let t = NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1, constant: 26)
        let w = NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 1, constant: 0)
        let h = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 0, constant: 200)
        return imageView
    }
}
