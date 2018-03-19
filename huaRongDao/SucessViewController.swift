//
//  SucessViewController.swift
//  huaRongDao
//
//  Created by 柏超曾 on 2018/3/17.
//  Copyright © 2018年 柏超曾. All rights reserved.
//

import Foundation
import UIKit
class  SucessViewController :UIViewController {
    
    
    typealias closureBlock = (String) -> Void
    var postValueBlock:closureBlock?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
        
    }
  
    
    
    @IBOutlet weak var close: UIButton!
    
    
    @IBAction func cl(_ sender: Any) {
        
         dismiss(animated: true, completion: nil)
        
        
//        NotificationCenter.default.post(Notification.init(name: Notification.Name(rawValue: "playAgain")))
        
        guard let postValueBlock = postValueBlock else { return }
        postValueBlock("传值到上一页")

        
    }
    
    
}
