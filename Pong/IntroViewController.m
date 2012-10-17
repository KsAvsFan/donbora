//
//  IntroViewController.m
//  Pong
//
//  Created by Don Bora on 10/17/12.
//  Copyright (c) 2012 Don Bora. All rights reserved.
//

#import "IntroViewController.h"
#import "ViewController.h"


@interface IntroViewController ()

@end

@implementation IntroViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)startGame:(id)sender
{
    ViewController* viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    viewController.view.alpha = 0.0f;
}

@end
