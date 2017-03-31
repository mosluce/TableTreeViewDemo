//
//  NodeCell.swift
//  TableTreeViewDemo
//
//  Created by 默司 on 2017/3/31.
//  Copyright © 2017年 默司. All rights reserved.
//

import UIKit
import SwiftIconFont

class NodeCell: UITableViewCell {

    @IBOutlet weak var insetConstraint: NSLayoutConstraint!
    @IBOutlet weak var arrowLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var level: Int = 0 {
        didSet {
            self.insetConstraint.constant = CGFloat(8 * level)
        }
    }
    
    var node: ListNode! {
        didSet {
            self.titleLabel.text = node.title
            self.arrowLabel.isHidden = (node.children?.count ?? 0) == 0
        }
    }
    
    override var isSelected: Bool {
        didSet {
            UIView.animate(withDuration: 0.2) {[unowned self] () in
                if self.isSelected {
                    self.arrowLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
                } else {
                    self.arrowLabel.transform = .identity
                }
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.arrowLabel.transform = .identity
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.arrowLabel.text = String.fontIconicIcon("caret-right")
        self.arrowLabel.font = UIFont.icon(from: .Iconic, ofSize: 16)
        self.titleLabel.font = UIFont.systemFont(ofSize: 16)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
