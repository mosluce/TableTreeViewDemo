//
//  SportsNode.swift
//  TableTreeViewDemo
//
//  Created by 默司 on 2017/3/31.
//  Copyright © 2017年 默司. All rights reserved.
//

import Foundation

class SportsNode: ListNode {
    convenience init() {
        self.init(title: "體育賽事", children: [
            ListNode(title: "籃球", children: [
                ListNode(title: "NBA"),
                ListNode(title: "CBA")
            ])
        ])
    }
}
