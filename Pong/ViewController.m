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
#import "Constants.h"


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
    
    NSLog(@"[[ballView.layer presentationLayer] frame].origin.x = %f", [[ballView.layer presentationLayer] frame].origin.x);
    NSLog(@"[[ballView.layer presentationLayer] frame].origin.y = %f", [[ballView.layer presentationLayer] frame].origin.y);
    if(CGRectIntersectsRect([[ballView.layer presentationLayer] frame], [[paddleViewLeft.layer presentationLayer] frame]))
    {
        NSLog(@"!!! The ball hit the left paddle");
    }
    else if(CGRectIntersectsRect([[ballView.layer presentationLayer] frame], [[paddleViewRight.layer presentationLayer] frame]))
    {
        NSLog(@"!!! The ball hit the right paddle");
    }
    else if ([[ballView.layer presentationLayer] frame].origin.x >= self.view.frame.size.height){
        NSLog(@"Frame went off screen, west bound");
        [ballView changeDirection:[[ballView.layer presentationLayer] frame].origin];
    }
    else if ([[ballView.layer presentationLayer] frame].origin.x <= 0){
        NSLog(@"Frame went off screen, east bound");
    }
    else if ([[ballView.layer presentationLayer] frame].origin.y >= self.view.frame.size.width){
        NSLog(@"Frame went off screen, south bound");
    }
    else if ([[ballView.layer presentationLayer] frame].origin.y <= ballView.frame.size.height/2){
        NSLog(@"Frame went off screen, north bound");
        [ballView changeDirection:[[ballView.layer presentationLayer] frame].origin];
    }
}


-(void)startTimer
{
    [NSTimer scheduledTimerWithTimeInterval:0.2f target:self selector:@selector(checkForCollision) userInfo:nil repeats:YES];
}

@end
