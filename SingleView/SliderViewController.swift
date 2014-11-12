//
//  DashBoardController.swift
//  SingleView
//
//  Created by Sage Path on 11/5/14.
//  Copyright (c) 2014 Sage Path. All rights reserved.
//

import UIKit

class SliderViewController : UIViewController {
    
    
    
    
    @IBOutlet weak var slideItButton: UIButton!
    @IBOutlet weak var hiddenView: UIView!
    //var moviePlayer:AVPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func slideIt(sender : AnyObject) {
        
        //let yPosition:CGFloat = 116
        //let xPosition:CGFloat = 0
        
        
        //hiddenView.frame = CGRectMake(xPosition, yPosition, 320, 568)
        
        let currFrame = hiddenView.frame
        
        let newX = currFrame.origin.x - 200
        let newY = currFrame.origin.y
        //let newWidth
        
        
        let newFrame:CGRect = CGRectMake(newX, newY, currFrame.width, currFrame.height);
        
        UIView.animateWithDuration(3.0, animations: {
            
            self.hiddenView.frame = newFrame
            println("slinding...")
            })
        
        println("In SliderViewController");
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}