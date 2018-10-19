//
//  ViewController.swift
//  LayoutSubViewDemo
//
//  Created by admin on 2018/9/10.
//  Copyright © 2018年 zywlw. All rights reserved.
//

import UIKit

enum RequestError: Error {
    case urlError
    case networkError
    case serverError(errorCode: Int)
}

protocol URLRequestConvertible {
    func asURLRequest() throws -> URLRequest
}

extension URLRequestConvertible {
    public var urlRequest: URLRequest? { return try? asURLRequest() }
}

class ViewController: UIViewController, URLRequestConvertible {
    
    func asURLRequest() throws -> URLRequest {
        guard let url = URL(string: "") else {
            throw RequestError.urlError
        }
        return URLRequest.init(url: url)
    }
    
    enum VendingMachineError: Error {
        case invalidSelection
        case insufficientFunds(coinsNeeded: Int)
        case outOfStock
    }
    
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var BlueView_Width: NSLayoutConstraint!
    @IBOutlet weak var GreenView_Height: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let model = OCObjectModel()
        model.getMethod()
//        view.backgroundColor = .red
//        try? getanotherjob()

    }
    
    func getanotherjob() throws {
        try? asURLRequest()
//        do {
//            try asURLRequest()
//        }catch RequestError.urlError {
//            print(RequestError.urlError)
//        }catch RequestError.networkError {
//
//        }catch RequestError.serverError(errorCode: 1) {
//
//        }catch {
//
//        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

   
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController")
        let originNav = UIApplication.shared.keyWindow?.rootViewController
        if let nav = originNav as? UINavigationController {
            nav.pushViewController(vc!, animated: false)
        }
//        let blueWidth = BlueView_Width.constant + 10
//        BlueView_Width.constant = blueWidth
//        GreenView_Height.constant = 60
//        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: .curveEaseIn, animations: { [weak self] in
//            if let strongSelf = self {
//                let blueWidth = strongSelf.blueView.frame.width + 10
//                strongSelf.blueView.frame.size.width = blueWidth
//                strongSelf.greenView.frame.size.width = 70
//                strongSelf.view.layoutIfNeeded()
////                strongSelf.blueView.layoutSubviews()
//            }
//
//        }, completion: nil)
    }
}

