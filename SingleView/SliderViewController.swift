//
//  DashBoardController.swift
//  SingleView
//
//  Created by Sage Path on 11/5/14.
//  Copyright (c) 2014 Sage Path. All rights reserved.
//

import UIKit

class SliderViewController : UIViewController {
    
    
    
    
    @IBOutlet weak var hiddenView: UIView!
    //var moviePlayer:AVPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let width = 200
        let height = 320
        let yPosition:CGFloat = 150
        let xPosition:CGFloat = 249

        
        hiddenView.frame = CGRectMake(xPosition, 600, 320, 568)

        
        let newFrame:CGRect = CGRectMake(xPosition, yPosition, 320, 568);
        
        UIView.animateWithDuration(3.0, animations: {
            
        self.hiddenView.frame = newFrame
        })
        
        println("In SliderViewController");
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}