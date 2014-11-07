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
        
        moviePlayer.fullscreen = true
        
        moviePlayer.shouldAutoplay = true
        
        //moviePlayer.movieSourceType = MPMovieSourceType.Streaming
        
        //moviePlayer.scalingMode = MPMovieScalingMode.AspectFill

        moviePlayer.controlStyle = MPMovieControlStyle.Embedded
        
        moviePlayer.initialPlaybackTime = 41;
        
        self.view.addSubview(moviePlayer.view)
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "moviePlayerDidFinishPlaying:", name: MPMoviePlayerPlaybackDidFinishNotification, object: moviePlayer)

        
        
        //self.view.bringSubviewToFront(moviePlayer.view)

        moviePlayer.play()
        
        println("Playing Movie");
    }
    
    @objc
    func moviePlayerDidFinishPlaying(notification: NSNotification){
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