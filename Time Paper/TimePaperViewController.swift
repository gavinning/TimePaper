//
//  TimePaperViewController.swift
//  Time Paper
//
//  Created by gavinning on 2018/4/14.
//  Copyright © 2018年 gavinning. All rights reserved.
//

import Cocoa

class TimePaperViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.frame = Config.frame
        
        self.list()
        
        
    }
    
    func list() {
        let scroll = NSScrollView()
        let docView = NSView()
        
        scroll.frame = self.view.frame
        scroll.documentView = docView
        scroll.verticalScrollElasticity = .allowed

        scroll.layer?.borderWidth = 0
        scroll.drawsBackground = false
        // scroll.backgroundColor = .black
        
        // scroll.contentView.drawsBackground = true
        // scroll.contentView.backgroundColor = .black
        
        let title = self.setTitle()
        scroll.contentView.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        let at = NSLayoutConstraint(item: title, attribute: .top, relatedBy: .equal, toItem: scroll.contentView, attribute: .top, multiplier: 1, constant: 10)
        let al = NSLayoutConstraint(item: title, attribute: .leading, relatedBy: .equal, toItem: scroll.contentView, attribute: .leading, multiplier: 1, constant: 10)
        
        scroll.contentView.addConstraints([at, al])

        
        let imageView = PaperImageView(image: NSImage(imageLiteralResourceName: "1"))
        imageView.named = "/Users/gavinning/Desktop/1.jpg"
        
        let imageView2 = PaperImageView(image: NSImage(imageLiteralResourceName: "2"))
        imageView2.named = "/Users/gavinning/Desktop/2.jpg"
        
        
//        imageView.userInterfaceLayoutDirection = .leftToRight
//        imageView.ignoresMultiClick = false
//        imageView.action = #selector(setWallpaper(_:))

        
        scroll.contentView.addSubview(imageView)
        scroll.contentView.addSubview(imageView2)

        // 添加约束前确定已经把需要布局的子view添加到父view上了
        // 一定要禁止将Autoresizing Mask转换为约束
        // 要把子view的约束加在父view上
        // 因为iOS中原点在左上角所以使用offset时注意right和bottom用负数
        // subview.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView2.translatesAutoresizingMaskIntoConstraints = false
        
        let t = NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: scroll.contentView, attribute: .top, multiplier: 1, constant: 26)
        let w = NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: scroll.contentView, attribute: .width, multiplier: 1, constant: 0)
        let h = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 0, constant: 200)

        let t2 = NSLayoutConstraint(item: imageView2, attribute: .top, relatedBy: .equal, toItem: imageView, attribute: .bottom, multiplier: 1, constant: 0)
        let w2 = NSLayoutConstraint(item: imageView2, attribute: .width, relatedBy: .equal, toItem: scroll.contentView, attribute: .width, multiplier: 1, constant: 0)
        let h2 = NSLayoutConstraint(item: imageView2, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 0, constant: 200)

        
        scroll.contentView.addConstraints([t,w,h])
        scroll.contentView.addConstraints([t2,w2,h2])
        scroll.documentView?.frame = scroll.contentView.frame
        self.view.addSubview(scroll)
    }
    
    func search() {
        
    }
    
    func setTitle() -> NSTextField {
        let label = NSTextField()
        
        label.isBezeled = false
//        label.drawsBackground = false
        label.isEditable = false
        label.isSelectable = false
        label.stringValue = "Time Paper"
        label.backgroundColor = NSColor.init(red: 41/255, green: 43/255, blue: 54/255, alpha: 1)
        label.font = NSFont.systemFont(ofSize: 18)
        label.textColor = .white
        
        label.sizeToFit()
        
        return label
    }

}
