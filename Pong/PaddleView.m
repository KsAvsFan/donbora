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
    
    if (touchLocation.y < self.frame.size.height/2)
    {
        self.center = CGPointMake(self.center.x, self.frame.size.height/2);
    }
    else if (touchLocation.y > (self.superview.frame.size.width - (self.frame.size.height/2)))
    {
        self.center = CGPointMake(self.center.x, (self.superview.frame.size.width - self.frame.size.height/2));
    }
    else {
        self.center = CGPointMake(self.center.x, touchLocation.y);
    }
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
    //[self movePaddleUp];
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
