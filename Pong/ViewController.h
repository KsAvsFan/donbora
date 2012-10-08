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
    IBOutlet PaddleView* paddleViewLeft;
    IBOutlet PaddleView* paddleViewRight;
}
@end
