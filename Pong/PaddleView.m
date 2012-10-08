//
//  PaddleView.m
//  Pong
//
//  Created by Don Bora on 10/8/12.
//  Copyright (c) 2012 Don Bora. All rights reserved.
//

#import "PaddleView.h"

@implementation PaddleView

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
    }
    return self;
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self.superview];
    CGPoint lowerLeftCorner = CGPointMake(0, self.frame.size.height);
    CGPoint outerLowerLeftCorner = [self convertPoint:lowerLeftCorner toView:self.superview];

    
    NSLog(@"OLLC.x = %f  OLLC.y = %f", outerLowerLeftCorner.x, outerLowerLeftCorner.y);
    NSLog(@"width = %f", self.superview.frame.size.width);
    
    
    
    if ((outerLowerLeftCorner.y <= self.superview.frame.size.width) &&
        (outerLowerLeftCorner.y >= self.frame.size.height/2))
    {
        self.center = CGPointMake(self.center.x, touchLocation.y);
    }
    
    lastY = touchLocation.y;
    
    /*if ((touchLocation.y + self.frame.size.height/2 <= self.superview.frame.size.width) &&
        (touchLocation.y - self.frame.size.height/2 >= 0)) {
        self.center = CGPointMake(self.center.x, touchLocation.y);
    }
     */
}

-(void)movePaddleUp
{
    [UIView animateWithDuration:2.0
                     animations:^{
                         self.center = CGPointMake(self.center.x, self.frame.size.height/2);
                     }
                     completion:^(BOOL finished) {
                         [self movePaddleDown];
                     }];
}


-(void)movePaddleDown
{
    [UIView animateWithDuration:2.0
                     animations:^{
                         self.center = CGPointMake(self.center.x, self.superview.frame.size.width - self.frame.size.height/2);
                     }
                     completion:^(BOOL finished) {
                         [self movePaddleUp];
                     }];
}


-(void)startMoving
{
    [self movePaddleUp];
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
