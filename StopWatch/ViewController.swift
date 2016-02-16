//
//  ViewController.swift
//  StopWatch
//
//  Created by Mime Matsuoka on 2016/02/14.
//  Copyright © 2016年 mimematsuoka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var count: Float = 0.0
    var timer: NSTimer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func start(){
        if !timer.valid{
            //タイマーが作動していなかったら動かす
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01,
                target: self,
                selector: Selector("up"),
                userInfo: nil,
                repeats: true
            )
        }
    }
    
    func up(){
        //countを0.01(時間経過分)足す
        count = count + 0.01
        //ラベルに少数点以下2桁まで表示
        label.text = String(format: "%.2f",count)
    }
    
    
    @IBAction func stop(){
        if timer.valid{
            //タイマーが作動していたら停止する
            timer.invalidate()
        }
    }
    
    @IBAction func reset(){
        count = 0
        label.text = String(count)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

