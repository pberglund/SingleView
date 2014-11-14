//
//  DashBoardController.swift
//  SingleView
//
//  Created by Sage Path on 11/5/14.
//  Copyright (c) 2014 Sage Path. All rights reserved.
//

import UIKit

class SliderViewController : BaseViewController {
    
    let transitionDistance:CGFloat = 300
    var lastDirection:Direction = Direction.None
    @IBOutlet weak var sliderView: UIView!
    @IBOutlet weak var expandCollapseButton: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let newFrame:CGRect = CGRectMake(0, sliderView.frame.origin.y, self.view.frame.width, self.view.frame.height);
        
        //self.sliderView.frame = newFrame;
        
        self.sliderView.frame = self.view.frame;

        
        //self.sliderView.frame = CGRectMake(0, 350, sliderView.frame.width, sliderView.frame.height);
        
        //let image = UIImage(named: "start.jpg")
        //let resized = RBResizeImage(image!, targetSize: self.view.bounds.size)
        
        //self.view.backgroundColor = UIColor(patternImage: resized)
        
    }
    
    
    
    @IBAction func swipedUp(sender: AnyObject) {
        
        println("swiped up...")
        slide(Direction.Up);
    }
    @IBAction func swipedDown(sender: AnyObject) {
        println("swiped down...")
        slide(Direction.Down);
    }
    
    func slide(direction: Direction){
        
        // If we havent slide, and they want to slide up, return
        if(lastDirection == Direction.None && direction == Direction.Up){
            return;
        }
        
        //IF they are trying to swipe the same way as the last time, return
        if(lastDirection == direction){
            return;
        }
        
        slideIt(direction)
        lastDirection = direction;
        
    }
    
    func slideIt(direction: Direction){
        println("In slideIt")
        
        let currFrame = sliderView.frame
        
        let newX:CGFloat = currFrame.origin.x
        var newY:CGFloat = currFrame.origin.y
        
        
        switch direction {
		case Direction.Up:
		    newY -= transitionDistance
        case Direction.Down:
            newY += transitionDistance
        default:
            println("Error finding a direction, returning")
            return;
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