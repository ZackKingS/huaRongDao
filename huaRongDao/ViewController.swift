//
//  ViewController.swift
//  huaRongDao
//
//  Created by 柏超曾 on 2018/3/17.
//  Copyright © 2018年 柏超曾. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    
    @IBOutlet weak var centerView: UIView!
    
    var emptyBtn =  UIButton()
    var startArray = [CGPoint]()
    
    
    var numbers = [3,2,1,4,8,6,7,5]
//    var numbers = [1,2,3,4,5,6,7,8]
//    var numbers = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
//    var numbers = [1,2,3,4,5,6,8,7]
    
    var comBtn = UIButton()
    


 

    var RightArray = [CGPoint]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setup()
        
         NotificationCenter.default.addObserver(self, selector: #selector(playAgain), name: NSNotification.Name(rawValue: "playAgain"), object: nil)
    }
    
    
   @objc func playAgain() {
        
      for  view  in self.centerView.subviews {
          view.removeFromSuperview()
      }
    
       setup()
    }

    func randomElementFromArray<T>(from array: Array<T>) -> T {
        let index: Int = Int(arc4random_uniform(UInt32(array.count)))
        return array[index]
    }
    
    func setup(){
        
        let cloumn = 3;
        let btnWH = 99
        var curClounm = 0 //列
        var curRow = 0    //行
        var x  = 0
        var y = 0
        let margin = 1
        
       
        
        //8
        for i in 0...numbers.count {
            
            curClounm = i % cloumn;
            curRow = i / cloumn;
            x = margin + (margin + btnWH) * curClounm ;
            y = (margin + btnWH) * curRow;
            let btn  = UIButton.init(frame: CGRect.init(x:  x , y: y, width: btnWH, height: btnWH))
            
            comBtn = btn
            
            RightArray.append(btn.center)
            
            if i == 8 {
                //记录最后一个btn
                emptyBtn = btn
                btn.backgroundColor = UIColor.clear
            }else{
                
                //设置btn的title   随机取得（1~8） 下一次不重复
//                btn.setTitle("\(i+1)", for: UIControlState.normal)
                
               btn.setTitle("\(numbers[i])", for: UIControlState.normal)
               btn.tag  = numbers[i]
                btn.backgroundColor = UIColor.init(red: 128/255.0, green: 168/255.0, blue: 193/255.0, alpha: 1.0)
                
    
            }
            
            
            btn.setTitleColor(UIColor.white, for: UIControlState.normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 50)
            btn.addTarget(self, action: #selector(tap(_:)), for: UIControlEvents.touchUpInside)
            btn.layer.cornerRadius = 8
            btn.layer.masksToBounds = true
            
            
   
           
            
            
            centerView.addSubview(btn)
            
            
        }
        

    }
    
    func playMusic (){
        
        var soundID:SystemSoundID = 0
        
        // 加载文件
        let fileUrl = NSURL(fileURLWithPath: Bundle.main.path(forResource: "sound", ofType: "mp3")!)
        AudioServicesCreateSystemSoundID(fileUrl, &soundID)
        
        // 播放短频音效
        AudioServicesPlayAlertSound(soundID)
        
        // 增加震动效果，如果手机处于静音状态，提醒音将自动触发震动
        //        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate));
    }
    @objc func tap (_ btn:UIButton){
    
        
        let distance_x = abs(btn.center.x - emptyBtn.center.x)
        let distance_y = abs(btn.center.y - emptyBtn.center.y)
        let distance =   sqrt(pow(distance_x, 2) + pow(distance_y, 2))

        
        if distance == 100  { //如果相邻  (严谨)
            
            playMusic()
            
            UIView.animate(withDuration: 1, animations: {
                //frame 互换
                let tempFrame  = btn.frame
                btn.frame = self.emptyBtn.frame
                self.emptyBtn.frame = tempFrame
            }, completion: nil)
            
           
            
            
        }
        


        
        var arr = [Int]()
        
        for i in  0...8 {
            let btn = centerView.subviews[i] as! UIButton
            


            if btn.tag == 1 && btn.center == RightArray[0] {


                arr.append(1)
            }

            if btn.tag == 2 && btn.center == RightArray[1] {


                arr.append(1)
            }


            if btn.tag == 3 && btn.center == RightArray[2] {

                arr.append(1)
            }

            if btn.tag == 4 && btn.center == RightArray[3] {


                arr.append(1)
            }

            if btn.tag == 5 && btn.center == RightArray[4] {


                arr.append(1)
            }

            if btn.tag == 6 && btn.center == RightArray[5] {

                arr.append(1)
            }

            if btn.tag == 7 && btn.center == RightArray[6] {


                arr.append(1)
            }

            if btn.tag == 8 && btn.center == RightArray[7] {

                arr.append(1)
            }

           
            
        
        }
        
         print(arr.count)
     
        if arr.count == 8 {
            
            print(self.centerView.subviews.count)
            
//            for  view   in self.centerView.subviews  {
//               let  btn = view  as! UIButton
//
//
//        
//            }
            
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
             
                
                let sucessVC =   SucessViewController()
                
                
                self.definesPresentationContext = true
                sucessVC.view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
                
                sucessVC.modalPresentationStyle = UIModalPresentationStyle(rawValue: Int(UInt8(UIModalPresentationStyle.overCurrentContext.rawValue) ))!
                
                
                
                self.present(sucessVC, animated: true, completion: nil)
                
                
                
            }
            
            
          
            
        }else{
            
            arr.removeAll()
        }
        
        
        

        
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

