//
//  PaperDataSource.swift
//  Time Paper
//
//  Created by gavinning on 2018/4/15.
//  Copyright © 2018年 gavinning. All rights reserved.
//

import Cocoa

@objc
public protocol PapersDataSource {
    
    @objc optional func paper(data list: Array<[String:String]>) -> Array<[String:String]>
}
