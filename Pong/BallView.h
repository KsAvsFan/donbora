//
//  BallView.h
//  Pong
//
//  Created by Don Bora on 10/10/12.
//  Copyright (c) 2012 Don Bora. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface BallView : UIView
{
    CAKeyframeAnimation* positionAnimation;
}
-(void)startAnimation;

@end
