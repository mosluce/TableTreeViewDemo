//
//  ListNode.swift
//  TableTreeViewDemo
//
//  Created by 默司 on 2017/3/31.
//  Copyright © 2017年 默司. All rights reserved.
//

import Foundation

struct ListNode {
    var title: String
    var children: [ListNode]?
    
    init(title: String, children: [ListNode]? = nil) {
        self.title = title
        self.children = children
    }
    
}
