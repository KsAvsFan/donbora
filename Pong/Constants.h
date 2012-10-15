//
//  Constants.h
//  Pong
//
//  Created by Don Bora on 10/14/12.
//  Copyright (c) 2012 Don Bora. All rights reserved.
//

#ifndef Pong_Constants_h
#define Pong_Constants_h

typedef enum  {Left, Right, Bottom, Top} DirectionType;

struct Direction
{
    DirectionType xDirection;
    DirectionType yDirection;
};

#endif
