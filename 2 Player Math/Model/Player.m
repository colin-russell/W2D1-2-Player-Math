//
//  Player.m
//  2 Player Math
//
//  Created by Colin on 2018-04-16.
//  Copyright © 2018 Colin Russell. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self) {
        _numberOfLives = 3;
    }
    return self;
}

- (void)loseLife {
    self.numberOfLives --;
}


@end
