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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
//        self.view.backgroundColor = UIColor.blue
        
        
    }
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var close: UIButton!
    
    
    @IBAction func cl(_ sender: Any) {
        
         dismiss(animated: true, completion: nil)
    }
    
    
}
