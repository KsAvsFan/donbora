//
//  PaddleView.m
//  Pong
//
//  Created by Don Bora on 10/8/12.
//  Copyright (c) 2012 Don Bora. All rights reserved.
//

#import "PaddleView.h"
#import "Constants.h"

@implementation PaddleView


@synthesize autoPlay =_autoPlay;


- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
    }
    return self;
}


-(void)setAutoPlay:(BOOL)autoPlay{
    if (autoPlay) {
        [NSTimer scheduledTimerWithTimeInterval:sComputerPaddleSpeed
                                         target:self
                                       selector:@selector(movePaddleDown:)
                                       userInfo:nil repeats:YES];
        _autoPlay = autoPlay;
    }
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!_autoPlay) {
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
}


-(void)movePaddleUp:(NSTimer*)timer
{
    if ((self.center.y - (self.frame.size.height/2)) <=  0) {
        [timer invalidate];
        [NSTimer scheduledTimerWithTimeInterval:sComputerPaddleSpeed
                                         target:self
                                       selector:@selector(movePaddleDown:)
                                       userInfo:nil
                                        repeats:YES];
    }
    else{
        self.center = CGPointMake(self.center.x, self.center.y - 1);
    }
}


-(void)movePaddleDown:(NSTimer*)timer
{
    if ((self.center.y + (self.frame.size.height/2)) >=  self.superview.frame.size.height) {
        [timer invalidate];
        [NSTimer scheduledTimerWithTimeInterval:sComputerPaddleSpeed
                                         target:self
                                       selector:@selector(movePaddleUp:)
                                       userInfo:nil
                                        repeats:YES];
    }
    else{
        self.center = CGPointMake(self.center.x, self.center.y + 1);
    }
}



@end
