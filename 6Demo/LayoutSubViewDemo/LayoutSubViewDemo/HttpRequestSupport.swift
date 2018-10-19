//
//  HttpRequestSupport.swift
//  LayoutSubViewDemo
//
//  Created by admin on 2018/9/17.
//  Copyright © 2018年 zywlw. All rights reserved.
//

import UIKit
import Alamofire

class HttpRequestSupport: NSObject {

    static let shareRequest = HttpRequestSupport()
    private override init() { super.init() }
    
    func doRequest() {
       let downloadRequest = Alamofire.download("http://v.jxvdy.com/sendfile/7q0n7zhXrqH0XQ17z9mh-jAgRP-fIkqlHFMxOzYQoK7XXJx5YxHamlCSyEs1QVMMnUMCNYrrdyT1HDPa3FADRX-MareIXw", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, to: nil)
        downloadRequest.response { (data) in
            print(data)
        }
        
        
    }
    
}
