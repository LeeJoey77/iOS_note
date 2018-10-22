//
//  TestView.swift
//  Initialization
//
//  Created by admin on 2018/3/23.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class TestView: UIView {

    @IBOutlet weak var titleLB: UILabel!
    
    //代码创建
    convenience init(str: String, frame: CGRect) {
        self.init(frame: frame)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    //xib 
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLB.text = "hahaha"
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
}
