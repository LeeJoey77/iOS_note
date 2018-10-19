//
//  ThirdParty_WebViewVC.swift
//  WebView_H5Demo
//
//  Created by admin on 2018/5/22.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ThirdParty_WebViewVC: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    var bridge: WebViewJavascriptBridge {
        return WebViewJavascriptBridge(forWebView: webView)!
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        loadURL()
        registerBridge()
        
        
    }
    
    func registerBridge() {
        WebViewJavascriptBridge.enableLogging()
        bridge.setWebViewDelegate(self)
        bridge.registerHandler("testObjcCallback") { (jsData, responseCallBack) in
            print("testObjcCallback:", jsData!)
            responseCallBack!("Response from testObjcCallback")
        }
        bridge.callHandler("testJavascriptHandler", data: ["foo":"before ready"])
    }

    func loadURL() {
        let url = Bundle.main.url(forResource: "ThirdParty_WebJS", withExtension: "html")
        let request = NSURLRequest(url: url! as URL)
        webView.loadRequest(request as URLRequest)
    }
    
    @IBAction func callHandler(_ sender: UIButton) {
        let data = ["greeting", "Hi there, js!"]
        bridge.callHandler("testJavascriptHandler", data: data) { (response) in
            print(response)
        }
    }
    
//    @IBAction func reload(_ sender: UIButton) {
//
//    }
    
    
    @IBAction func disableSafetyTimeout(_ sender: UIButton) {
        bridge.disableJavscriptAlertBoxSafetyTimeout()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension  ThirdParty_WebViewVC {
    func webViewDidStartLoad(_ webView: UIWebView) {
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
    }
}













