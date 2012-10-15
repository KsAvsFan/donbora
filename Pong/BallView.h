//
//  BallView.h
//  Pong
//
//  Created by Don Bora on 10/10/12.
//  Copyright (c) 2012 Don Bora. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Constants.h"


@interface BallView : UIView 
{
    CAKeyframeAnimation*    positionAnimation;
    DirectionType           xSourceDirection;
    DirectionType           ySourceDirection;
    
    CGFloat                 containingViewHeight;
    CGFloat                 containingViewWidth;
}
-(void)startAnimation;
-(void)changeDirection:(CGPoint) collisionPoint;
@end
