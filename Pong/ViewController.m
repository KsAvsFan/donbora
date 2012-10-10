//
//  ViewController.m
//  Pong
//
//  Created by Don Bora on 10/8/12.
//  Copyright (c) 2012 Don Bora. All rights reserved.
//

#import "ViewController.h"
#import "PaddleView.h"
#import "BallView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [paddleViewRight startMoving];
    [ballView startAnimation];
    

    
    [self startTimer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight || interfaceOrientation == UIInterfaceOrientationLandscapeLeft );
}


-(void)checkForCollision
{
   // NSLog(@"checkForCollision: bv.x = %f bv.y = %f", [[ballView.layer presentationLayer] frame].origin.x,[[ballView.layer presentationLayer] frame].origin.x);
    //ballView.backgroundColor = [UIColor blueColor];
    
    if(CGRectIntersectsRect([[ballView.layer presentationLayer] frame], [[paddleViewLeft.layer presentationLayer] frame]))
    {
        NSLog(@"!!! The ball hit the left paddle");
    }
    else if(CGRectIntersectsRect([[ballView.layer presentationLayer] frame], [[paddleViewRight.layer presentationLayer] frame]))
    {
        NSLog(@"!!! The ball hit the right paddle");
    }
}


-(void)startTimer
{
    [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(checkForCollision) userInfo:nil repeats:YES];
}

@end
