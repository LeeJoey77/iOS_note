//
//  CustomView_Fileowner.swift
//  XibDemo
//
//  Created by admin on 2018/9/7.
//  Copyright © 2018年 zywlw. All rights reserved.
//

import UIKit

class CustomView_Fileowner: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var label: UILabel!
    
    //代码创建, 执行此方法, 不执行 init?(coder aDecoder: NSCoder)
    override init(frame: CGRect) {
        super.init(frame: frame)
        awakeFromNib()
    }
    
    //添加在 storyboard 上, 执行此方法
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView = loadNibFileOwner()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
}
