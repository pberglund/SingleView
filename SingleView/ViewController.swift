//
//  ViewController.swift
//  SingleView
//
//  Created by Sage Path on 11/5/14.
//  Copyright (c) 2014 Sage Path. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {

    var moviePlayer:MPMoviePlayerController!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "start.jpg")
        let resized = RBResizeImage(image!, targetSize: self.view.bounds.size)
        
        self.view.backgroundColor = UIColor(patternImage: resized)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func RBResizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
    let size = image.size
    
    let widthRatio  = targetSize.width  / image.size.width
    let heightRatio = targetSize.height / image.size.height
    
    // Figure out what our orientation is, and use that to form the rectangle
    var newSize: CGSize
    if(widthRatio > heightRatio) {
        newSize = CGSizeMake(size.width * heightRatio, size.height * heightRatio)
    } else {
        newSize = CGSizeMake(size.width * widthRatio,  size.height * widthRatio)
    }
    
    // This is the rect that we've calculated out and this is what is actually used below
    let rect = CGRectMake(0, 0, newSize.width, newSize.height)
    
    // Actually do the resizing to the rect using the ImageContext stuff
    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    image.drawInRect(rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage
    }

    
}

