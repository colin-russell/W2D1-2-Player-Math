//
//  ViewController.m
//  2 Player Math
//
//  Created by Colin on 2018-04-16.
//  Copyright © 2018 Colin Russell. All rights reserved.
//

#import "ViewController.h"
#import "GameModel.h"
#import "Player.h"

@interface ViewController ()

@property (nonatomic, strong)GameModel *gameModel;
@property (nonatomic) NSString *userInput;
@property (weak, nonatomic) IBOutlet UILabel *playerOneScore;
@property (weak, nonatomic) IBOutlet UILabel *playerTwoScore;
@property (weak, nonatomic) IBOutlet UILabel *displayQuestion;
@property (weak, nonatomic) IBOutlet UILabel *displayAnswer;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.gameModel = [GameModel new];
    [self updateQuestion:[self.gameModel generateQuestion]];
    self.userInput = @"";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateQuestion:(NSString *)text {
    self.displayQuestion.text = text;
}

- (void)updateAnswerText {
    
}


 // number buttons
- (IBAction)zeroButtonTapped:(UIButton *)sender {
    if (![self.userInput isEqualToString:@""]){
        self.userInput = [NSString stringWithFormat:@"%@0", self.userInput];
        self.displayAnswer.text = self.userInput;
    }
}

- (IBAction)numberButtonTapped:(UIButton *)sender {
    self.userInput = [NSString stringWithFormat:@"%@%lu", self.userInput, sender.tag];
    self.displayAnswer.text = self.userInput;
}



// enter button
- (IBAction)enterButton:(UIButton *)sender {
    NSLog(@"number entered: %@", self.userInput);
    
    //self.gameModel.playerAnswer = [self.userInput integerValue];
    [self.gameModel checkAnswer:[self.userInput integerValue]];
    self.userInput = @"";

    self.displayQuestion.text = [self.gameModel generateQuestion];
    self.playerOneScore.text = [NSString stringWithFormat:@"Player 1 lives: %lu", self.gameModel.player1.numberOfLives];
    self.playerTwoScore.text = [NSString stringWithFormat:@"Player 2 lives: %lu", self.gameModel.player2.numberOfLives];
    self.displayAnswer.text = self.gameModel.outputText;

}

- (IBAction)clearButton:(UIButton *)sender {
    self.userInput = @"";
    self.displayAnswer.text = self.userInput;
}





@end
