//
//  GameViewController.m
//  Flappy Bird v1
//
//  Created by Sean Darryanto on 6/27/14.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController



//Start button is hidden.
//Bird jumps up smoothly with the timer.
//Calls PlaceTunnels method.
//Tunnels move smoothly with timer.
-(IBAction)StartGame:(id)sender{
    
    StartGame.hidden = YES;
    
    BirdMovement = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(BirdMoving) userInfo:nil repeats:YES];
    
    [self PlaceTunnels];
    
    TunnelMovement = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(TunnelMoving) userInfo:nil repeats:YES];
    
}




-(void)PlaceTunnels{
    
    randomTopTunnelPosition = arc4random() % 350;
    randomTopTunnelPosition = randomTopTunnelPosition - 228;
    
    randomBottomTunnelPosition = randomTopTunnelPosition + 655;
    
    TunnelTop.center = CGPointMake(340, randomTopTunnelPosition);
    TunnelBottom.center = CGPointMake(340, randomBottomTunnelPosition);
    
}




//Sets the speed and distance the bird will jump and fall.
-(void)BirdMoving{
    
    Bird.center = CGPointMake(Bird.center.x, Bird.center.y - birdFlight);
    
    birdFlight = birdFlight - 3;
        
    if(birdFlight < -12){
        birdFlight = -12;
    }
        
    if(birdFlight > 0){
        Bird.image = [UIImage imageNamed:@"upMe.gif"];
    }
    
    if(birdFlight < 0){
        Bird.image = [UIImage imageNamed:@"downMe.gif"];
    }
    
}



//Moves the tunnel to the left.
//Makes the tunnels end the game if the Bird touches them.
-(void)TunnelMoving{

    TunnelTop.center = CGPointMake(TunnelTop.center.x - 4, TunnelTop.center.y);
    TunnelBottom.center = CGPointMake(TunnelBottom.center.x - 4, TunnelBottom.center.y);
    
    
    if(TunnelTop.center.x < -28){
        [self PlaceTunnels];
    }
    if(TunnelBottom.center.x <= 18 && TunnelBottom.center.x >= 16){
        [self Score];
    }
    
    
    if(CGRectIntersectsRect(Bird.frame, TunnelTop.frame)){
        [self GameOver];
    }
    if(CGRectIntersectsRect(Bird.frame, TunnelBottom.frame)){
        [self GameOver];
    }
    if(CGRectIntersectsRect(Bird.frame, Bottom.frame)){
        [self GameOver];
    }
}



//Adds a point to the scoreNumber integer.
//Displays score on screen as integer.
-(void)Score{
    
    scoreNumber = scoreNumber + 1;
    ScoreLabel.text = [NSString stringWithFormat:@"%d", scoreNumber];
    EndScoreLabel.text = [NSString stringWithFormat:@"%d", scoreNumber];

    
}



//Ends game by hiding all the items.
-(void)GameOver{
    
    if (scoreNumber > highScoreNumber) {
        [[NSUserDefaults standardUserDefaults] setInteger:scoreNumber forKey:@"HighScoreNumber"];
    }
    
    [TunnelMovement invalidate];
    [BirdMovement invalidate];
    
    Restart.hidden = NO;
    EndScoreLabel.hidden = NO;
    
    ScoreLabel.hidden = YES;
    TunnelTop.hidden = YES;
    TunnelBottom.hidden = YES;
    Bird.hidden = YES;
    
}



//Everytime the user taps, the bird jumps up 20 pixels.
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    birdFlight = 20;
    
    //Once the bird reaches the top of the game, he is unable to jump 20 pixels.
    if(Bird.center.y < 20){
        birdFlight = 0;
    }
    
}













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
    
    EndScoreLabel.hidden = YES;
    Restart.hidden = YES;
//    scoreNumber= 0;
    
    highScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
