//
//  GameModel.m
//  2 Player Math
//
//  Created by Colin on 2018-04-16.
//  Copyright © 2018 Colin Russell. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _player1 = [Player new];
        _player2 = [Player new];
        [_player1 setName:@"Player 1"];
        [_player2 setName:@"Player 2"];
        _playerIndex = 0;
        _outputText = @"";
        
    }
    return self;
}

- (Player *)currentPlayer {
    if (self.playerIndex == 0){
        return self.player1;
    }
    else if (self.playerIndex == 1){
        return self.player2;
    }
    else {
        self.playerIndex = 0;
        return self.player1;
    }
}

// if enter is pressed
- (NSString *)generateQuestion {
    NSInteger x = arc4random_uniform(20);
    NSInteger y = arc4random_uniform(20);
    
    self.correctAnswer = x+y;
    
    return [NSString stringWithFormat:@"%@: %lu + %lu = ?", self.currentPlayer.name, x, y];
}

- (void)checkAnswer {
    if (self.playerAnswer == self.correctAnswer) {
        //NSLog(@"%@ CORRECT", self.currentPlayer.name);
        self.outputText = [NSString stringWithFormat:@"%@ CORRECT", self.currentPlayer.name];
    }
    else {
        //NSLog(@"%@ WRONG", self.currentPlayer.name);
        self.outputText = [NSString stringWithFormat:@"%@ WRONG", self.currentPlayer.name];
        [self.currentPlayer loseLife];
        if (self.currentPlayer.numberOfLives == 0) {
            self.outputText = @"GAME OVER";
        }
        
    }
    self.playerIndex ++;
}



@end
