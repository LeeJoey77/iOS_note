//
//  NibProtocol.swift
//  XibDemo
//
//  Created by admin on 2018/9/7.
//  Copyright © 2018年 zywlw. All rights reserved.
//

import Foundation
import UIKit

protocol NibLoadableProtocol { }

extension NibLoadableProtocol where Self : UIView {
    
    /*
     static func loadNib(_ nibNmae :String = "") -> Self{
     let nib = nibNmae == "" ? "\(self)" : nibNmae
     return Bundle.main.loadNibNamed(nib, owner: nil, options: nil)?.first as! Self
     }
     */
    
    //类型方法
    static func loadNib(_ nibNmae: String? = nil) -> Self {
        return Bundle.main.loadNibNamed(nibNmae ?? "\(self)", owner: nil, options: nil)?.first as! Self
    }
    
    //设置 File's Owner 的 CustomClass
    //实例方法
    func loadNibFileOwner(_ nibNmae: String? = nil) -> UIView {
        //获取实例的类型
        let object: AnyObject = object_getClass(self)!
        //"\(object)": AntennaParameters.XXXXXX
        //获取真正的类型名
        let className = type(of: object).description().components(separatedBy: ".").last
        
        let contentView = Bundle.main.loadNibNamed(nibNmae ?? className!, owner: self, options: nil)?.first as! UIView
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
        return Bundle.main.loadNibNamed(nibNmae ?? className!, owner: self, options: nil)?.first as! UIView
    }
    
}

extension CustomView_View: NibLoadableProtocol { }
extension CustomView_Fileowner: NibLoadableProtocol { }

