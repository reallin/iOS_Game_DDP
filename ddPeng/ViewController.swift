//
//  ViewController.swift
//  ddPeng
//
//  Created by daytonlin on 2017/11/3.
//  Copyright © 2017年 daytonlin. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var photoName:NSMutableArray = ["q1","q2","q3","q4","q5","q6","q7","q8"]
    var btnStatus:UIButton?;
    
    var allName:NSMutableArray? = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setAllName()
        initView()
    }
    
    func setAllName(){
    
        for i in 0..<32{
            let index = i%photoName.count
            allName?.add(index)
            allName?.add(index)
        }
    }
    
    func initView(){
        let width = (view.frame.width-20)/8
        for i in 0 ..< 8{
            for j in 0 ..< 8{
                let left = 10 + CGFloat(j) * CGFloat(width)
                let top = 10 + CGFloat(i) * CGFloat(width)
                let randomNum = Int(arc4random()) % ((allName?.count)!-1) + 1
                let pIndex = allName![Int(randomNum)] as! Int
                let pStr = photoName[pIndex ] as! String
                
                let imageNormal = UIImage(named: pStr)
                //let imageSelect = UIImage(named: pStr)?.withRenderingMode(.alwaysTemplate)
                let btn = UIButton(frame: CGRect(x: left,y: top,width:width,height:width))
                btn.tag = Int(pIndex)
                //btn.setImage(image, for: UIControlState.focused)
               // btn.setImage(imageSelect, for: UIControlState.selected)
                btn.setImage(imageNormal, for: UIControlState.normal)
                btn.addTarget(self, action: #selector(checkBtn(_ :)), for: .touchUpInside)
                view.addSubview(btn)
            }
        }
    }
    
    func randomPhoto(index:Int)->String{
        let randomNum = Int(arc4random()) % (index-1) + 1
        return allName![Int(randomNum)] as! String
    }
    
    
    func checkBtn(_ sender:UIButton?){
        //let btn = sender;
        if btnStatus == nil {
            //let btn = sender;
            sender?.isEnabled = false;
            btnStatus = sender;
            
        }else{
            if sender != btnStatus && sender?.tag == btnStatus?.tag {
                sender?.isHidden = true
                btnStatus?.isHidden = true
                btnStatus = nil
            }else{
                btnStatus?.isEnabled = true
                btnStatus = nil
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

