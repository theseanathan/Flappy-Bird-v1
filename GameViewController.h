//
//  GameViewController.h
//  Flappy Bird v1
//
//  Created by Sean Darryanto on 6/27/14.
//  Copyright (c) 2014 TheSeanathan. All rights reserved.
//

#import <UIKit/UIKit.h>

int birdFlight;
int randomTopTunnelPosition;
int randomBottomTunnelPosition;
int scoreNumber;
NSInteger highScoreNumber;


@interface GameViewController : UIViewController
{
    
    IBOutlet UIImageView *Bird;
    IBOutlet UIButton *StartGame;
    IBOutlet UIImageView *TunnelTop;
    IBOutlet UIImageView *TunnelBottom;
    IBOutlet UIImageView *Top;
    IBOutlet UIImageView *Bottom;
    IBOutlet UIButton *Restart;
    IBOutlet UILabel *ScoreLabel;
    IBOutlet UILabel *EndScoreLabel;
    
    NSTimer *BirdMovement;
    NSTimer *TunnelMovement;
    
}

-(IBAction)StartGame:(id)sender;
-(void)BirdMoving;
-(void)TunnelMoving;
-(void)PlaceTunnels;
-(void)Score;
-(void)GameOver;


@end
