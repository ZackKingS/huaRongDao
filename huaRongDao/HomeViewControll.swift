//
//  HomeViewControll.swift
//  huaRongDao
//
//  Created by 柏超曾 on 3/19/18.
//  Copyright © 2018 柏超曾. All rights reserved.
//
import Foundation
import UIKit

class  HomeViewControll :UIViewController {
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        self.navigationController?.navigationBar.isHidden = true
        
        
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.isTranslucent = true


//         self.navigationController?.navigationBar.alpha = 0;
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        
        
    }
    
    
    @IBAction func threeClick(_ sender: UIButton) {
  
        let  vc = ZBViewController()
        vc.numbers = [3,2,1,4,8,6,7,5]
        vc.cloumn = 3
        vc.zb_Font = 50
        self.navigationController?.pushViewController(vc , animated: true)
 
        
    }
    
    
    @IBAction func fourClick(_ sender: UIButton) {
        
     
        
        let  vc = ZBViewController()
        vc.numbers = [14,2,15,4,5,8,7,6,9,10,12,11,13,1,3]
        vc.cloumn = 4
        vc.zb_Font = 40
        self.navigationController?.pushViewController(vc , animated: true)
        
    }
    
    
    @IBAction func FiveClick(_ sender: UIButton) {
        
        
        
        let  vc = ZBViewController()
        vc.numbers = [1,2,24,4,5,8,7,6,22,10,11,12,13,14,15,16,17,18,19,20,21,9,23,3]
        vc.cloumn = 5
        vc.zb_Font = 30
        self.navigationController?.pushViewController(vc , animated: true)
        
        
    }
    
    

    
    
}

