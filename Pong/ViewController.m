//
//  ViewController.m
//  Pong
//
//  Created by Don Bora on 10/8/12.
//  Copyright (c) 2012 Don Bora. All rights reserved.
//

#import "ViewController.h"
#import "PaddleView.h"
#import "Constants.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [paddleViewRight startMoving];
    
    ballView.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    directionX = directionY = 1;
    
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


-(void)moveBall
{

    if ((ballView.frame.origin.y + ballView.frame.size.width > self.view.frame.size.width) ||
        (ballView.frame.origin.y < 0)) {
        directionY *= -1;
    }
    
    if ((ballView.frame.origin.x + ballView.frame.size.height > self.view.frame.size.height) ||
        (ballView.frame.origin.x < 0)) {
        directionX *= -1;
    }
    
    ballView.center = CGPointMake(ballView.center.x + directionX, ballView.center.y + directionY);    
 }


-(void)startTimer
{
    [NSTimer scheduledTimerWithTimeInterval:0.001f target:self selector:@selector(moveBall) userInfo:nil repeats:YES];
}

@end
