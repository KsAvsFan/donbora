//
//  ViewController.m
//  Pong
//
//  Created by Don Bora on 10/8/12.
//  Copyright (c) 2012 Don Bora. All rights reserved.
//

#import "ViewController.h"
#import "PaddleView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    paddleViewRight.autoPlay = YES;
    
    ballView.center = self.view.center;
    directionX = directionY = 1;
    mPlayerOneScore = mPlayerTwoScore = 0;
    
    oPlayerOneScore.text = [NSString stringWithFormat:@"%i", mPlayerOneScore];
    oPlayerTwoScore.text = [NSString stringWithFormat:@"%i", mPlayerTwoScore];
    
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

-(void)resetGame
{
    mPlayerOneScore = mPlayerTwoScore = 0;
    oPlayerOneScore.text = @"0";
    oPlayerTwoScore.text = @"0";
    [self resetBall:nil];
}

-(void)resetBall:(NSTimer*)timer
{
    [timer invalidate];
    if (mPlayerTwoScore >= 1) {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Win"
                                                            message:@"Someone lost"
                                                           delegate:self
                                                  cancelButtonTitle:@"No thanks, I suck"
                                                  otherButtonTitles:@"Bring it!", nil];
        [alertView show];
        [alertView release];
    }
    else{
        ballView.center = self.view.center;
        directionY *= -1;
        directionX *= -1;
        [self startTimer];
    }
}

-(void)moveBall:(NSTimer*)timer
{
    if ((ballView.frame.origin.y + ballView.frame.size.width > self.view.frame.size.width) ||
        (ballView.frame.origin.y < 0))
    {
        directionY *= -1;
    }
    
    if (ballView.frame.origin.x + ballView.frame.size.height > self.view.frame.size.height){
        [self resetBall:timer];
        mPlayerOneScore++;
        oPlayerOneScore.text = [NSString stringWithFormat:@"%i", mPlayerOneScore];
    }
    else if(ballView.frame.origin.x < 0){
        [self resetBall:timer];
        mPlayerTwoScore++;
        oPlayerTwoScore.text = [NSString stringWithFormat:@"%i", mPlayerTwoScore];
    }
    
    if (CGRectIntersectsRect(ballView.frame, paddleViewLeft.frame)) {
        directionX *= -1;
        directionY *= -1;
    }
    else if (CGRectIntersectsRect(ballView.frame, paddleViewRight.frame)) {
        directionX *= -1;
        directionY *= -1;
    }
    
    
    ballView.center = CGPointMake(ballView.center.x + directionX, ballView.center.y + directionY);    
}


-(void)startTimer
{
    [NSTimer scheduledTimerWithTimeInterval:0.005f target:self selector:@selector(moveBall:) userInfo:nil repeats:YES];
}

#pragma mark UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            // do nothing
            break;
            
        case 1:
            [self resetGame];
        default:
            break;
    }
}

@end
