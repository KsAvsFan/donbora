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
    }
    return self;
}


-(void)startAnimation
{
    [self animatePath];
}


-(void)animatePath
{
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, self.superview.frame.size.width, self.superview.frame.size.height/2);
    CGPathAddLineToPoint(path, NULL, 0,self.superview.frame.size.height/2);
    
    positionAnimation.path = path;
    positionAnimation.calculationMode = kCAAnimationPaced;
    positionAnimation.duration = 2.0f;
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
