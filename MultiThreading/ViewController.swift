//
//  ViewController.swift
//  MultiThreading
//
//  Created by Michael Tirenin on 7/28/14.
//  Copyright (c) 2014 Michael Tirenin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.grayColor().CGColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func downloadButton(sender: UIButton) {
        
        var url = NSURL(string: "http://upload.wikimedia.org/wikipedia/commons/e/eb/Nancy_Reagan_reopens_Statue_of_Liberty_1986.jpg")
        
        var myQueue = NSOperationQueue()
        
        myQueue.addOperationWithBlock({() -> Void in
            
            var data = NSData(contentsOfURL: url)
            NSOperationQueue.mainQueue().addOperationWithBlock( {() -> Void in
            
                    var myImage = UIImage(data: data)
                
                    self.imageView.image = myImage
                })
            
            })
    }
}

