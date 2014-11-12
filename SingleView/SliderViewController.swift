//
//  DashBoardController.swift
//  SingleView
//
//  Created by Sage Path on 11/5/14.
//  Copyright (c) 2014 Sage Path. All rights reserved.
//

import UIKit

class SliderViewController : UIViewController {
    
    var viewArray:[UIView]!
    var currentIndex:Int!
    
    
    @IBOutlet weak var slideItButton: UIButton!
    @IBOutlet weak var hiddenView: UIView!
    
    @IBOutlet weak var firstPageView: UIView!
    @IBOutlet weak var secondPageView: UIView!
    
    //var moviePlayer:AVPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewArray = [firstPageView, secondPageView]
        currentIndex = 0
        
        resetViews()

        
    }
    
    
    @IBAction func slideIt(sender : AnyObject) {
        
        
        
    }
    
    func resetViews(){
        
        if viewArray == nil{
            RETURN
        }
        
        
        for item in viewArray {
            item.alpha = 0;
            self.view.sendSubviewToBack(item)
        }
    }
    
    func slideIt(left:Bool){
        println("In slideIt")
        
        resetViews()
        
        self.view.bringSubviewToFront(hiddenView)
        
        let currFrame = hiddenView.frame
        
        let newX = currFrame.origin.x - 384
        let newY = currFrame.origin.y
        
        
        let newFrame:CGRect = CGRectMake(newX, newY, currFrame.width, currFrame.height);
        
        UIView.animateWithDuration(3.0, animations: {
            
            self.hiddenView.frame = newFrame
            println("slinding...")
            
            }, completion: {
            (value: Bool) in
            
            if left
            {
                
                if self.currentIndex >= 0
                {
                    let newPage = self.viewArray[self.currentIndex]
                    newPage.alpha = 1;
                    self.currentIndex = self.currentIndex + 1
                
                    println("showed it");
                }
                
            }
            else{
                
                if self.currentIndex < self.viewArray.count
                {
                    let newPage = self.viewArray[self.currentIndex]
                    newPage.alpha = 1;
                    self.currentIndex = self.currentIndex + 1
                    
                    println("showed it");
                }
                
            }
            })
        println("Leaving slideIt");
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}