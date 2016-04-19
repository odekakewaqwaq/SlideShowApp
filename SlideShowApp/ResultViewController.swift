//
//  ResultViewController.swift
//  Test0417
//
//  Created by 永井 伸枝 on 2016/04/18.
//  Copyright © 2016年 nobue.nagai. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var zoomedImageView: UIImageView!
    var slideCount = 0
    var zoomedImage :UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zoomedImageView.image = zoomedImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

}
