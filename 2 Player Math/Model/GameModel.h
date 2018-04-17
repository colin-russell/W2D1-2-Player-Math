//
//  GameModel.h
//  2 Player Math
//
//  Created by Colin on 2018-04-16.
//  Copyright © 2018 Colin Russell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"


@interface GameModel : NSObject

@property (nonatomic, strong) Player *player1;
@property (nonatomic, strong) Player *player2;
@property (nonatomic) NSInteger playerIndex;
@property (nonatomic) NSInteger playerAnswer;
@property (nonatomic) NSInteger correctAnswer;
@property (nonatomic, strong) NSString *outputText;

- (Player *)currentPlayer;
- (NSString *)generateQuestion;
- (void)checkAnswer;

@end
