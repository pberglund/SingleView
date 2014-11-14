//
//  DashBoardController.swift
//  SingleView
//
//  Created by Sage Path on 11/5/14.
//  Copyright (c) 2014 Sage Path. All rights reserved.
//

import UIKit

class SliderViewController : UIViewController {
    
    let transitionDistance:CGFloat = 300
    var goUp = true
    
    @IBAction func buttonPushed(sender: AnyObject) {
        println("pushed...")
        
        let position = sliderView.frame.origin.y;
        
        if goUp{
            slideIt(goUp)
        }
        else{
            slideIt(goUp)
        }
        
        goUp = !goUp;
    }
    
    @IBOutlet weak var sliderView: UIView!
    
    @IBOutlet weak var expandCollapseButton: UIButton!
    
    
    func slideIt(up:Bool){
        println("In slideIt")
        
        let currFrame = sliderView.frame
        
        let newX:CGFloat = currFrame.origin.x
        var newY:CGFloat = currFrame.origin.y
        
        
        if up
        {
            newY -= transitionDistance
        }
        else{
            newY += transitionDistance
        }

        
        let newFrame:CGRect = CGRectMake(newX, newY, currFrame.width, currFrame.height);
        
        UIView.animateWithDuration(2.0, animations: {
            
            self.sliderView.frame = newFrame
            println("sliding...")
            
            }, completion: {
            (value: Bool) in
            
                println("Done sliding")
                
                        })
        println("Leaving slideIt");
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}