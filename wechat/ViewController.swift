//
//  ViewController.swift
//  wechat
//
//  Created by 苏小贱 on 15/4/28.
//  Copyright (c) 2015年 苏小贱. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIScrollViewDelegate{

    @IBOutlet var ScrollView1: UIScrollView!
    
    @IBOutlet var PageControl1: UIPageControl!
    
    var images = ["tutorial_background_00","tutorial_background_01","tutorial_background_02","tutorial_background_03","tutorial_background_04"]
    var curPage = 0
    var screenWidth:Int = 0
    var screenHeight:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        screenWidth = Int(self.view.frame.width)
        screenHeight = Int(self.view.frame.height)
        PageControl1.currentPage = curPage
        ScrollView1.backgroundColor = UIColor.brownColor()
        ScrollView1.contentSize = CGSize(width: 5*screenWidth, height: screenHeight)
        ScrollView1.delegate = self
        for (var i=0;i<5; i++) {
        var image = UIImageView(frame: CGRect(x: i*screenWidth, y: 0, width: screenWidth, height: screenHeight))
        image.image = UIImage(named: images[i])
        ScrollView1.addSubview(image)
            PageControl1.addTarget(self, action: "pageChange", forControlEvents: UIControlEvents.ValueChanged)
        }
        
        var myButton1 = UIButton(frame: CGRect(x: 20, y: screenHeight-100, width: 120, height: 40))
//        myButton1.backgroundColor = UIColor.blueColor()
        myButton1.setTitle("注册", forState: .Normal)
//        myButton1.addTarget(self, action: "Clike",forControlEvents: .TouchUpInside)
        myButton1.setBackgroundImage(UIImage(named: "button-background"), forState: UIControlState.Normal)
        myButton1.setBackgroundImage(UIImage(named: "background-gradient"), forState: UIControlState.Selected)
        self.view.addSubview(myButton1)
        
        var myButton2 = UIButton(frame: CGRect(x: 235, y: screenHeight-100, width: 120, height: 40))
//        myButton2.backgroundColor = UIColor.blueColor()
        myButton2.setTitle("登录", forState: .Normal)
        myButton2.setBackgroundImage(UIImage(named: "button-background"), forState: UIControlState.Normal)
        myButton2.setBackgroundImage(UIImage(named: "background-gradient"), forState: UIControlState.Selected)
        self.view.addSubview(myButton2)
    }
    //定位页码
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var curPage = Int(ScrollView1.contentOffset.x)/320
        PageControl1.currentPage = Int ( curPage)
    }
   
    func pageChange(){
        var curPage = PageControl1.currentPage
        ScrollView1.scrollRectToVisible(CGRect(x: curPage*320, y: 0, width: 320, height: 568), animated: true )
        
        
    }

    @IBAction func PageControl2(sender: UIPageControl) {
        NSLog("curPag:\(sender.currentPage)")
        
        ScrollView1.scrollRectToVisible(CGRect(x: sender.currentPage * screenWidth, y: 0, width: screenWidth, height: screenHeight), animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

