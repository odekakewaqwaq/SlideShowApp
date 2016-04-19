//
//  ViewController.swift
//  SlideShowApp
//
//  Created by 永井 伸枝 on 2016/04/17.
//  Copyright © 2016年 nobue.nagai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButtonState: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var forwardButtonState: UIButton!
    @IBOutlet weak var rewindButtonState: UIButton!
    
    let imageArray = [UIImage(named:"image1.jpg"), UIImage(named:"image2.jpg"), UIImage(named:"image3.jpg")]
    var slideCount: Int = 0
    var timer = NSTimer?()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = imageArray[0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startButton(sender: UIButton) {
        if timer == nil{
            timer = NSTimer.scheduledTimerWithTimeInterval(2,target:self,selector:#selector(slideForward),userInfo:nil,repeats: true)
            rewindButtonState.enabled = false
            forwardButtonState.enabled = false
            startButtonState.setTitle("Stop", forState: .Normal)
        }
        else{
            self.timer?.invalidate()
            self.timer = nil
            rewindButtonState.enabled = true
            forwardButtonState.enabled = true
            startButtonState.setTitle("Start", forState: .Normal)
        }

        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        let resultViewController:ResultViewController = segue.destinationViewController as! ResultViewController
        resultViewController.zoomedImage = imageArray[slideCount]
    }
    
    @IBAction func unwind(segue:UIStoryboardSegue){
        
    }
    
    @IBAction func forwardButton() {
         slideForward()
    }
    @IBAction func rewindButton() {
        slideRewind()
    }
    
    func slideForward(){
        if slideCount < imageArray.count-1 {
            slideCount += 1
        }
        else{
            slideCount = 0
        }
        imageView.image = imageArray[slideCount]
    }


    func slideRewind(){
        if slideCount == 0{
            slideCount = imageArray.count-1
        }
        else{
            slideCount -= 1
        }
        imageView.image = imageArray[slideCount]
    }
}

