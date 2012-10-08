//
//  PaddleView.h
//  Pong
//
//  Created by Don Bora on 10/8/12.
//  Copyright (c) 2012 Don Bora. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaddleView : UIView
{
    CGFloat lastY;
}

-(void)movePaddleUp;
-(void)movePaddleDown;
-(void)startMoving;

@end
