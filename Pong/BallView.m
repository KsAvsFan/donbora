//
//  BallView.m
//  Pong
//
//  Created by Don Bora on 10/10/12.
//  Copyright (c) 2012 Don Bora. All rights reserved.
//

#import "BallView.h"

@implementation BallView

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        [positionAnimation retain];
        
        xSourceDirection = Left;
        ySourceDirection = Bottom;
        
    }
    return self;
}


-(void)startAnimation
{
    containingViewHeight = self.superview.frame.size.height;
    containingViewWidth = self.superview.frame.size.width;
    [self animatePath];
}


-(void)animatePath
{
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, containingViewWidth/2, containingViewHeight/2);
    CGPathAddLineToPoint(path, NULL, (containingViewWidth/4) * 3, -10);
    
    positionAnimation.path = path;
    positionAnimation.calculationMode = kCAAnimationPaced;
    positionAnimation.duration = 1.0f;
    positionAnimation.repeatCount =  0;
    positionAnimation.removedOnCompletion = YES;
    positionAnimation.delegate = self;
    
    [self.layer addAnimation:positionAnimation forKey:@"position"];
}



-(void)changeDirection:(CGPoint) collisionPoint
{
    CGMutablePathRef path = CGPathCreateMutable();

    [self.layer removeAnimationForKey:@"position"];

    if (xSourceDirection == Left && collisionPoint.y <= self.frame.size.height/2) {
        
        CGPathMoveToPoint(path, NULL, collisionPoint.x, collisionPoint.y);
        CGPathAddLineToPoint(path, NULL, containingViewWidth, containingViewWidth - collisionPoint.x);
        // send the ball left and
    }

    positionAnimation.path = path;
    positionAnimation.calculationMode = kCAAnimationPaced;
    positionAnimation.duration = 1.0f;
    positionAnimation.repeatCount =  0;
    positionAnimation.removedOnCompletion = YES;
    positionAnimation.delegate = self;
    
    [self.layer addAnimation:positionAnimation forKey:@"position"];
}



- (void)animationDidStop:(CAAnimation *)animation finished:(BOOL)flag
{
   // [self updatePath];
}


-(void)updatePath
{
    CGMutablePathRef path = CGPathCreateMutable();

    [self.layer removeAnimationForKey:@"position"];
    
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, self.superview.center.x, self.superview.frame.size.height);
    
    positionAnimation.path = path;
    
    [self.layer addAnimation:positionAnimation forKey:@"position"];
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
