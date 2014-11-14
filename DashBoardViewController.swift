//
//  DashBoardController.swift
//  SingleView
//
//  Created by Sage Path on 11/5/14.
//  Copyright (c) 2014 Sage Path. All rights reserved.
//

import UIKit
import MediaPlayer
import AVFoundation

class DashBoardController : BaseViewController {
    
    var moviePlayer:MPMoviePlayerController!
    //var moviePlayer:AVPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bundle = NSBundle.mainBundle()
        let pathhtml = bundle.pathForResource("Big_Buck_Bunny_Trailer", ofType: "m4v")
        var url:NSURL = NSURL(fileURLWithPath: pathhtml!)!

        
        moviePlayer = MPMoviePlayerController(contentURL: url)

        moviePlayer.view.frame = self.view.bounds
    
        moviePlayer.fullscreen = true
        
        moviePlayer.shouldAutoplay = true
        
        //moviePlayer.movieSourceType = MPMovieSourceType.Streaming
        
        //moviePlayer.scalingMode = MPMovieScalingMode.AspectFill

        moviePlayer.controlStyle = MPMovieControlStyle.Embedded
        
        moviePlayer.initialPlaybackTime = 28;
        
        self.view.addSubview(moviePlayer.view)
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "moviePlayerOver:", name: MPMoviePlayerPlaybackDidFinishNotification, object: moviePlayer)
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: "moviePlayerOver:", name: MPMoviePlayerDidExitFullscreenNotification, object: moviePlayer)

        
        
        self.view.bringSubviewToFront(moviePlayer.view)

        moviePlayer.play()
        
        println("Playing Movie");
    }
    
    @objc
    func moviePlayerOver(notification: NSNotification){
    //Action take on Notification
        println("In moviePlayerDidFinishPlaying");
        //let vc : AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("StartPage")
        //self.showViewController(vc as UIViewController, sender: vc)
        self.performSegueWithIdentifier("Custom from 1 to main", sender: self)

        println("Show initial controller")


}

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}