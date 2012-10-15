//
//  ViewController.h
//  Pong
//
//  Created by Don Bora on 10/8/12.
//  Copyright (c) 2012 Don Bora. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PaddleView;

@interface ViewController : UIViewController
{
    IBOutlet PaddleView*    paddleViewLeft;
    IBOutlet PaddleView*    paddleViewRight;
    IBOutlet UILabel*       oPlayerOneScore;
    IBOutlet UILabel*       oPlayerTwoScore;
    IBOutlet UIView*        ballView;
    
    int                     directionY;
    int                     directionX;
    int                     mPlayerOneScore;
    int                     mPlayerTwoScore;
}


-(void)moveBall:(NSTimer*)timer;

@end
