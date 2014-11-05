//
//  CustomSegue.m
//  SingleView
//
//  Created by Sage Path on 11/5/14.
//  Copyright (c) 2014 Sage Path. All rights reserved.
//

#import "CustomSegue.h"
#import "QuartzCore/QuartzCore.h"

@implementation CustomSegue


-(void)perform {
    
    UIView *sv = ((UIViewController *)self.sourceViewController).view;
    UIView *dv = ((UIViewController *)self.destinationViewController).view;
    
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    dv.center = CGPointMake(sv.center.x + sv.frame.size.width,
                            dv.center.y);
    [window insertSubview:dv aboveSubview:sv];
    
    [UIView animateWithDuration:0.4
                     animations:^{
                         dv.center = CGPointMake(sv.center.x,
                                                 dv.center.y);
                         sv.center = CGPointMake(0 - sv.center.x,
                                                 dv.center.y);
                     }
                     completion:^(BOOL finished){
                         [[self sourceViewController] presentViewController:
                          [self destinationViewController] animated:NO completion:nil];
                     }];
}
@end

/*

-(void)perform {
    
    UIViewController *sourceViewController = (UIViewController*)self.sourceViewController;;
    UIViewController *destinationController = (UIViewController*)self.destinationViewController;
    
    CATransition* transition = [CATransition animation];
    transition.duration = .25;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush; //kCATransitionMoveIn; //, kCATransitionPush, kCATransitionReveal, kCATransitionFade
    transition.subtype = kCATransitionFromLeft; //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
    
    
    
    [sourceViewController.navigationController.view.layer addAnimation:transition
                                                                forKey:kCATransition];
    
    [sourceViewController.navigationController pushViewController:destinationController animated:NO];
    
}
@end

*/


/*
- (void)perform {
    UIViewController *sourceViewController = self.sourceViewController;
    UIViewController *destinationViewController = self.destinationViewController;
    
    // Add the destination view as a subview, temporarily
    [sourceViewController.view addSubview:destinationViewController.view];
    
    // Transformation start scale
    destinationViewController.view.transform = CGAffineTransformMakeScale(0.05, 0.05);
    
    // Store original centre point of the destination view
    CGPoint originalCenter = destinationViewController.view.center;
    // Set center to start point of the button
    destinationViewController.view.center = self.originatingPoint;
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:UIViewAnimationOptionTransitionFlipFromRight
                     animations:^{
                         // Grow!
                         destinationViewController.view.transform = CGAffineTransformMakeScale(1.0, 1.0);
                         destinationViewController.view.center = originalCenter;
                     }
                     completion:^(BOOL finished){
                         [destinationViewController.view removeFromSuperview]; // remove from temp super view
                         [sourceViewController presentViewController:destinationViewController animated:NO completion:NULL]; // present VC
                     }];
}

@end

*/
