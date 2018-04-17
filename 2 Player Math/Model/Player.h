//
//  Player.h
//  2 Player Math
//
//  Created by Colin on 2018-04-16.
//  Copyright © 2018 Colin Russell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic) NSInteger numberOfLives;
@property (nonatomic, strong) NSString *name;
@property (nonatomic) NSInteger answer;

- (void)loseLife;

@end
