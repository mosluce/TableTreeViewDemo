//
//  ViewController.swift
//  TableTreeViewDemo
//
//  Created by 默司 on 2017/3/31.
//  Copyright © 2017年 默司. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var topLevel = [
        SportsNode(),
        ListNode(title: "電競")
    ]
    
    var nodes: [ListNode]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.automaticallyAdjustsScrollViewInsets = false
        self.nodes = topLevel
        self.tableView.allowsMultipleSelection = true
        self.tableView.register(UINib(nibName: "NodeCell", bundle: nil), forCellReuseIdentifier: "NodeCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NodeCell", for: indexPath)
        
        if let cell = cell as? NodeCell {
            cell.node = nodes[indexPath.row]
            cell.selectionStyle = .none
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let node = nodes[indexPath.row]
        
        if let children = node.children {
            var row = indexPath.row + 1
            var indexPaths: [IndexPath] = []
            children.forEach({
                $0.level = node.level + 1
                self.nodes.insert($0, at: row)
                indexPaths.append(IndexPath(row: row, section: 0))
                row += 1
            })
            self.tableView.beginUpdates()
            self.tableView.insertRows(at: indexPaths, with: .top)
            self.tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let node = nodes[indexPath.row]
        
        if let children = node.children {
            let row = indexPath.row + 1
            var indexPaths: [IndexPath] = []
            for i in 0..<children.count {
                indexPaths.append(IndexPath(row: row + i, section: 0))
                self.nodes.remove(at: row)
            }
            self.tableView.beginUpdates()
            self.tableView.deleteRows(at: indexPaths, with: .top)
            self.tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

