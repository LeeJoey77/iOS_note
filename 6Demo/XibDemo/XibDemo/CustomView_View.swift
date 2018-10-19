//
//  CustomView_View.swift
//  XibDemo
//
//  Created by admin on 2018/9/7.
//  Copyright © 2018年 zywlw. All rights reserved.
//

import UIKit

class CustomView_View: UIView {

    @IBOutlet weak var label: UILabel!

    class func newInstance() -> CustomView_View {
        return Bundle.main.loadNibNamed("CustomView_View", owner: nil, options: nil)?.first as! CustomView_View
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
}
