//
//  ViewController.swift
//  XibDemo
//
//  Created by admin on 2018/9/7.
//  Copyright © 2018年 zywlw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fileOwnerView1: CustomView_Fileowner!
    var viewView1: CustomView_View!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFileOwnerView()
        setupViewView()
    }

    func setupFileOwnerView() {
        let fileOwnerView2 = CustomView_Fileowner(frame: fileOwnerView1.frame)
        fileOwnerView2.frame.origin.y = fileOwnerView1.frame.maxY + 10
        fileOwnerView2.backgroundColor = .purple
        view.addSubview(fileOwnerView2)
    }
    
    func setupViewView() {
        //使用类型方法创建
        viewView1 = CustomView_View.newInstance()
        viewView1.frame = CGRect(x: 50, y: 400, width: 200, height: 100)
        viewView1.backgroundColor = .orange
        view.addSubview(viewView1)
        
        //使用协议扩展创建
        let viewView2 = CustomView_View.loadNib()
        viewView2.frame = CGRect(x: 50, y: 510, width: 200, height: 100)
        viewView2.backgroundColor = .orange
        view.addSubview(viewView2)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

