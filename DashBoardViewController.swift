//
//  DashBoardController.swift
//  SingleView
//
//  Created by Sage Path on 11/5/14.
//  Copyright (c) 2014 Sage Path. All rights reserved.
//

import UIKit
import MediaPlayer

class DashBoardController : UIViewController {
    
    var moviePlayer:MPMoviePlayerController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let image = UIImage(named: "start.jpg")
        //let resized = RBResizeImage(image!, targetSize: CGSizeMake(100,100))
        
        //self.view.backgroundColor = UIColor(patternImage: image!)
        
        var url:NSURL = NSURL(string: "http://jplayer.org/video/m4v/Big_Buck_Bunny_Trailer.m4v")!

        moviePlayer = MPMoviePlayerController(contentURL: url)

        //moviePlayer.view.frame = CGRect(x: 25, y: 25, width: 900, height: 750)

        moviePlayer.view.frame = self.view.bounds
        
        self.view.addSubview(moviePlayer.view)

        moviePlayer.fullscreen = true
        
        moviePlayer.scalingMode = MPMovieScalingMode.AspectFill

        moviePlayer.controlStyle = MPMovieControlStyle.Embedded

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}