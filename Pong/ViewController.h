//
//  ViewController.h
//  Pong
//
//  Created by Don Bora on 10/8/12.
//  Copyright (c) 2012 Don Bora. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PaddleView;
@class BallView;

@interface ViewController : UIViewController
{
    IBOutlet PaddleView*    paddleViewLeft;
    IBOutlet PaddleView*    paddleViewRight;
    IBOutlet BallView*      ballView;
}

@property(nonatomic, retain)IBOutlet BallView* aBV;
@end
