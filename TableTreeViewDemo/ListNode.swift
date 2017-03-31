//
//  ListNode.swift
//  TableTreeViewDemo
//
//  Created by 默司 on 2017/3/31.
//  Copyright © 2017年 默司. All rights reserved.
//

import Foundation

class ListNode {
    var title: String
    var children: [ListNode]?
    var level: Int = 0
    
    init(title: String, children: [ListNode]? = nil) {
        self.title = title
        self.children = children
    }
    
}
