//
//  LevelTwenty.m
//  NumStop
//
//  Created by Travis McGowan on 6/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LevelTwenty.h"
#import "LevelsView.h"
@interface LevelTwenty ()

@end

@implementation LevelTwenty
@synthesize randomNumberLabel,incrementNumberLabel, labelSwitch, restartLabel, loopLabel;
@synthesize tryLabel, levelLabel, levelString, buttonSend, buttonBack, buttonGlow, buttonImage;
@synthesize loopString, tryString;



-(IBAction)backLevels:(id)sender{
    //goes back to levels view
    levelLabel.text = @"";
    
    LevelsView *stages = [[LevelsView alloc] initWithNibName:nil bundle:[NSBundle mainBundle]];
    
    
    
    self.levelString = [levelLabel text];
    [stages setLevelsComplete:self.levelString];
    
    
    [self presentModalViewController:stages animated:YES];
    
    
    
}


-(IBAction)send:(id)sender{
    
    //label switches from start to stop to start
    
    
    if([labelSwitch.text isEqualToString: @"START"]){
        
        buttomFlipTimer = [NSTimer scheduledTimerWithTimeInterval: 0.12 target:self selector:@selector(buttonFlipCount) userInfo:nil repeats:YES];
        
        
        
        buttonBack.enabled = NO;
        incrementNumberLabel.text = @"";
        
        UIImage *buttonImages = [UIImage imageNamed:@"redbtnunpress.PNG"];
        [buttonSend setBackgroundImage:buttonImages forState:UIControlStateNormal];
        [self.view addSubview:buttonSend];
        
        buttonImage.hidden = 0;
        
        UIImage *buttonImagePr = [UIImage imageNamed:@""];
        [buttonSend setBackgroundImage:buttonImagePr forState:UIControlStateNormal];
        [self.view addSubview:buttonSend];
        
        
        
        UIImage *buttonImagePress = [UIImage imageNamed:@"redbtnpress.PNG"];
        [buttonSend setBackgroundImage:buttonImagePress forState:UIControlStateHighlighted];
        [self.view addSubview:buttonSend];
        
        
        
        loopNumber = 1;
        loopLabel.text = [[NSString alloc] initWithFormat:@"Loop #: %d", loopNumber];
        
        
        //incrementing timer start
        
        MainInt = 0;
        timer = [NSTimer scheduledTimerWithTimeInterval: 0.015 target:self selector:@selector(countup) userInfo:nil repeats:YES];
        
        labelSwitch.text = @"STOP";
        restartLabel.hidden = YES;
        incrementNumberLabel.font = [UIFont fontWithName:@"DBLCDTempBlack" size:80];
        
        
        
        
    }
    else if([labelSwitch.text isEqualToString: @"STOP"]){
        [buttomFlipTimer invalidate];
        
        
        buttonBack.enabled = YES;
        buttonImage.hidden = 1;
        
        UIImage *buttonImages = [UIImage imageNamed:@"greenbtnunpress.PNG"];
        [buttonSend setBackgroundImage:buttonImages forState:UIControlStateNormal];
        [self.view addSubview:buttonSend];
        
        
        UIImage *buttonImagePress = [UIImage imageNamed:@"redbtnpress.PNG"];
        [buttonSend setBackgroundImage:buttonImagePress forState:UIControlStateHighlighted];
        [self.view addSubview:buttonSend];
        
        
        
        
        
        //restart labwl is hiddwn and the timer is stopped
        
        restartLabel.hidden = YES;
        
        [timer invalidate];
        
        incrementNumberLabel.text = [NSString stringWithFormat:@"%i", MainInt];
        
        labelSwitch.text = @"START";
        
        
        
        
        
        //--check if incremented number is smaller, larger or equal to the random number
        
        if([incrementNumberLabel.text isEqualToString: randomNumberLabel.text]){
            UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"GOOD JOB!"
                                                          message:@"Level Passed"
                                                         delegate:self
                                                cancelButtonTitle:@"Play Again"
                                                otherButtonTitles:@"Next Level", nil];
            [msg show];
            
            
            
        }
        else if (MainInt > ranNumber) {
            
            UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"TOO SLOW!"
                                                          message:@"Wake Up!"
                                                         delegate:self
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
            [msg show];
            
            
        }
        else if (MainInt < ranNumber) {
            
            UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"TOO FAST!"
                                                          message:@"Patience My Friend"
                                                         delegate:self
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
            [msg show];
            
            
        }
        
        
        
    }
    
    
}


-(void)countup{
    
    //incrementing the number
    
    MainInt += 1;
    
    
    incrementNumberLabel.text = [NSString stringWithFormat:@"%i", MainInt];
    
    if(MainInt == ranNumber+2){
        restartLabel.hidden = NO;
        restartLabel.text = @"Restarting in : 3";
    }
    else if(MainInt == ranNumber+3){
        restartLabel.text = @"Restarting in : 2";
    }
    else if(MainInt == ranNumber+4){
        restartLabel.text = @"Restarting in : 1";
    }
    
    
    if(MainInt >= ranNumber+5){
        restartLabel.hidden = YES;
        MainInt = 0;
        
        //shows how many times the timer looped
        
        loopNumber +=1;
        loopLabel.text = [[NSString alloc] initWithFormat:@"Loop #: %d", loopNumber];
        
        if(loopNumber == 10){
            restartLabel.font = [UIFont systemFontOfSize:35];
            restartLabel.textColor = [UIColor redColor];
            
            
        }
        
        else if(loopNumber == 11)
        {
            [buttomFlipTimer invalidate];
            
            buttonBack.enabled = YES;
            

            
            [timer invalidate];
            UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"Come On!"
                                                          message:@"You lapped 10 times!"
                                                         delegate:self
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
            [msg show];
        }
        
    }
    
    
}

-(void)buttonFlipCount{
    buttonFlipInt += 1;
    buttonImage.hidden = 0;
    
    int flipCount = buttonFlipInt %2;
    
    if (flipCount == 0){
        buttonGlow.hidden = 0;
        
    }
    else {
        buttonGlow.hidden = 1;
        
    }
    
    
}


-(void) alertView :(UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    //alert view responses
    
    NSString *select = [alertView buttonTitleAtIndex: buttonIndex];
    
    
    if ([select isEqualToString:@"Next Level"]){ 
        
         levelLabel.text = @"21";
        
        LevelsView *stages = [[LevelsView alloc] initWithNibName:nil bundle:[NSBundle mainBundle]];
        
        
        
        self.levelString = [levelLabel text];
        [stages setLevelsComplete:self.levelString];
        
        self.tryString = [tryLabel text];
        [stages setGetTryString:self.tryString];
        
        self.loopString = [loopLabel text];
        [stages setGetLoopString:self.loopString];
        
        
        [self presentModalViewController:stages animated:YES];
        
        
    }
    if ([select isEqualToString:@"OK"]){ 
        buttonBack.enabled = YES;
        incrementNumberLabel.font = [UIFont fontWithName:@"Chalkduster" size:80]; 
        
        restartLabel.font = [UIFont systemFontOfSize:17];
        restartLabel.textColor = [UIColor blackColor];
        
        UIImage *buttonImages = [UIImage imageNamed:@"greenbtnunpress.PNG"];
        [buttonSend setBackgroundImage:buttonImages forState:UIControlStateNormal];
        [self.view addSubview:buttonSend];
        
        UIImage *buttonImagePress = [UIImage imageNamed:@"greenbtnpress.PNG"];
        [buttonSend setBackgroundImage:buttonImagePress forState:UIControlStateHighlighted];
        [self.view addSubview:buttonSend];
        
        
        ranNumber = [self getRandomNumberBetweenMin:500 andMax:1000];
        
        randomNumberLabel.text = [[NSString alloc] initWithFormat:@"%d", ranNumber] ;
        incrementNumberLabel.text = @"Ready?";
        
        loopNumber = 1;
        loopLabel.text = [[NSString alloc] initWithFormat:@"Loop #: %d", loopNumber];
        
        tryNumber += 1;
        tryLabel.text = [[NSString alloc] initWithFormat:@"Try #: %d", tryNumber];
        
        labelSwitch.text = @"START";
        
    }
    if ([select isEqualToString:@"Play Again"]){ 
        buttonBack.enabled = YES;
        incrementNumberLabel.font = [UIFont fontWithName:@"Chalkduster" size:80]; 
        restartLabel.font = [UIFont systemFontOfSize:17];
        restartLabel.textColor = [UIColor blackColor];
        
        UIImage *buttonImages = [UIImage imageNamed:@"greenbtnunpress.PNG"];
        [buttonSend setBackgroundImage:buttonImages forState:UIControlStateNormal];
        [self.view addSubview:buttonSend];
        
        UIImage *buttonImagePress = [UIImage imageNamed:@"greenbtnpress.PNG"];
        [buttonSend setBackgroundImage:buttonImagePress forState:UIControlStateHighlighted];
        [self.view addSubview:buttonSend];
        
        ranNumber = [self getRandomNumberBetweenMin:1 andMax:10];
        
        randomNumberLabel.text = [[NSString alloc] initWithFormat:@"%d", ranNumber] ;
        incrementNumberLabel.text = @"Ready?";
        
        loopNumber = 1;
        loopLabel.text = [[NSString alloc] initWithFormat:@"Loop #: %d", loopNumber];
        
    }
    
    
}

-(int) getRandomNumberBetweenMin:(int)min andMax:(int)max//sets random number min and max numbers
{
	return ( (arc4random() % (max-min+1)) + min );
}


- (void)viewDidLoad
{
    
    MainInt = 0;
    
    
    ranNumber = [self getRandomNumberBetweenMin:500 andMax:1000];
    
    
    randomNumberLabel.text = [[NSString alloc] initWithFormat:@"%d", ranNumber] ;
    
    
    tryNumber = 1;
    tryLabel.text = [[NSString alloc] initWithFormat:@"Try #: %d", tryNumber];
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

//- (void)applicationDidEnterBackground:(UIApplication *)application {

//}

- (void)viewDidUnload
{
    
    [self setRandomNumberLabel:nil];
    [self setIncrementNumberLabel:nil];
    [self setLabelSwitch:nil];
    [self setRestartLabel:nil];
    [self setLoopLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end