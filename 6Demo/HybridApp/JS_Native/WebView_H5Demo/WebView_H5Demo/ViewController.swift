//
//  ViewController.swift
//  WebView_H5Demo
//
//  Created by admin on 2018/5/9.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func toFirstVC(_ sender: UIButton) {

        if sender.tag == 200 {
            let webViewVC = storyboard?.instantiateViewController(withIdentifier: "WebViewViewController")
            navigationController?.pushViewController(webViewVC!, animated: true)
        }else if sender.tag == 201 {
            let wkWebViewVC = storyboard?.instantiateViewController(withIdentifier: "WKWebViewViewController")
            navigationController?.pushViewController(wkWebViewVC!, animated: true)
        }else {
            let js_NativeCameraVC = storyboard?.instantiateViewController(withIdentifier: "JS_NativeCameraViewController")
            navigationController?.pushViewController(js_NativeCameraVC!, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

