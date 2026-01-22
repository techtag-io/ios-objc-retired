//
//  LevelTwentyFive.m
//  NumStop
//
//  Created by Travis McGowan on 6/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LevelTwentyFive.h"
#import "LevelsView.h"

@interface LevelTwentyFive ()

@end

@implementation LevelTwentyFive
@synthesize randomNumberLabel,incrementNumberLabel, labelSwitch, restartLabel, loopLabel;
@synthesize tryLabel, levelLabel, levelString, buttonSend, buttonBack, buttonGlow, buttonImage;
@synthesize tryString, loopString, stopButton, stopButton2, stopButton3;




-(IBAction)backLevels:(id)sender{
    //goes back to levels view
    levelLabel.text = @"";
    
    LevelsView *stages = [[LevelsView alloc] initWithNibName:nil bundle:[NSBundle mainBundle]];
    
    
    
    self.levelString = [levelLabel text];
    [stages setLevelsComplete:self.levelString];
    
    
    [self presentModalViewController:stages animated:YES];
    
    
    
}


-(IBAction)send:(id)sender{
   
    buttonSend.hidden = YES;
    stopButton.hidden = NO;
    stopButton2.hidden = YES;
    stopButton3.hidden = YES;
    
    

        buttomFlipTimer = [NSTimer scheduledTimerWithTimeInterval: 0.12 target:self selector:@selector(buttonFlipCount) userInfo:nil repeats:YES];
        
        
        
        buttonBack.enabled = NO;
        incrementNumberLabel.text = @"";

        
        MainInt = 0;
        timer = [NSTimer scheduledTimerWithTimeInterval: 0.2 target:self selector:@selector(countup) userInfo:nil repeats:YES];
        

        incrementNumberLabel.font = [UIFont fontWithName:@"DBLCDTempBlack" size:80];
    
    [buttonImage setImage:[UIImage imageNamed:@"redbtnunpress.PNG"]];
    buttonImage.hidden = NO;
  }

-(IBAction)stopButton:(id)sender{

 
    
    
    if([incrementNumberLabel.text isEqualToString: randomNumberLabel.text]){
     
        
        ranNumber2 = [self getRandomNumberBetweenMin:60 andMax:100];
        
        randomNumberLabel.text = [[NSString alloc] initWithFormat:@"%d", ranNumber2] ;
        
        
        MainInt2 = ranNumber;
          timer2 = [NSTimer scheduledTimerWithTimeInterval: 0.08 target:self selector:@selector(countup2) userInfo:nil repeats:YES];
        
        
        buttonSend.hidden = YES;
        stopButton.hidden = YES;
        stopButton2.hidden = NO;
        stopButton3.hidden = YES;
        
    }
    else if (MainInt > ranNumber) {
        
        UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"TOO SLOW!"
                                                      message:@"Level Failed"
                                                     delegate:self
                                            cancelButtonTitle:@"QUIT"
                                            otherButtonTitles:@"PLAY AGAIN", nil];
        [msg show];
        
        buttonSend.hidden = NO;
        stopButton.hidden = YES;
        stopButton2.hidden = YES;
        stopButton3.hidden = YES;
        
        [timer invalidate];
        [buttomFlipTimer invalidate];
        
        buttonImage.hidden = YES;
    }
    else if (MainInt < ranNumber) {
        
        UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"TOO FAST!"
                                                      message:@"Level Failed"
                                                     delegate:self
                                            cancelButtonTitle:@"QUIT"
                                            otherButtonTitles:@"PLAY AGAIN", nil];
        [msg show];
        
        buttonSend.hidden = NO;
        stopButton.hidden = YES;
        stopButton2.hidden = YES;
        stopButton3.hidden = YES;
        [timer invalidate];
        [buttomFlipTimer invalidate];
        
          buttonImage.hidden = YES;
    }

    [timer invalidate];
}

-(IBAction)stopButton2:(id)sender{

    if(MainInt2 == ranNumber2){
        
       
        
        ranNumber3 = [self getRandomNumberBetweenMin:300 andMax:1000];
        
        randomNumberLabel.text = [[NSString alloc] initWithFormat:@"%d", ranNumber3] ;
        
          MainInt3 = ranNumber;
        timer3 = [NSTimer scheduledTimerWithTimeInterval: 0.04 target:self selector:@selector(countup3) userInfo:nil repeats:YES];
        
        buttonSend.hidden = YES;
        stopButton.hidden = YES;
        stopButton2.hidden = YES;
        stopButton3.hidden = NO;
        
    }
    else if (MainInt2 > ranNumber2) {
        
        UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"TOO SLOW!"
                                                      message:@"Level Failed"
                                                     delegate:self
                                            cancelButtonTitle:@"QUIT"
                                            otherButtonTitles:@"PLAY AGAIN", nil];
        [msg show];
        
        buttonSend.hidden = NO;
        stopButton.hidden = YES;
        stopButton2.hidden = YES;
        stopButton3.hidden = YES;
        
        [timer invalidate];
        [buttomFlipTimer invalidate];
        
          buttonImage.hidden = YES;
    }
    else if (MainInt2 < ranNumber2) {
        
        UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"TOO FAST!"
                                                      message:@"Level Failed"
                                                     delegate:self
                                            cancelButtonTitle:@"QUIT"
                                            otherButtonTitles:@"PLAY AGAIN", nil];
        [msg show];
        
        buttonSend.hidden = NO;
        stopButton.hidden = YES;
        stopButton2.hidden = YES;
        stopButton3.hidden = YES;
        
        [timer invalidate];
        [buttomFlipTimer invalidate];
        
          buttonImage.hidden = YES;
    }
    

    [timer2 invalidate];
}
-(IBAction)stopButton3:(id)sender{

    if(MainInt3 == ranNumber3){
        UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"CONGRATULATIONS!"
                                                      message:@"You have successfully passed the game!"
                                                     delegate:self
                                            cancelButtonTitle:@"Play Again"
                                            otherButtonTitles:@"Go Back To Levels", nil];
        [msg show];
        

        

    }
    else if (MainInt3 > ranNumber3) {
        
        UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"TOO SLOW!"
                                                      message:@"Level Failed"
                                                     delegate:self
                                            cancelButtonTitle:@"QUIT"
                                            otherButtonTitles:@"PLAY AGAIN", nil];
        [msg show];
        
  
    }
    else if (MainInt3 < ranNumber3) {
        
        UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"TOO FAST!"
                                                      message:@"Level Failed"
                                                     delegate:self
                                            cancelButtonTitle:@"QUIT"
                                            otherButtonTitles:@"PLAY AGAIN", nil];
        [msg show];
        
   
        
    }
    
    
    [timer3 invalidate];
    [buttomFlipTimer invalidate];
    
    buttonSend.hidden = NO;
    stopButton.hidden = YES;
    stopButton2.hidden = YES;
    stopButton3.hidden = YES;
    
      buttonImage.hidden = YES;

}

-(void)countup{
    
    //incrementing the number
    
    MainInt += 1;
    
    
    incrementNumberLabel.text = [NSString stringWithFormat:@"%i", MainInt];
    
 }
-(void)countup2{
    
    //incrementing the number
  //  MainInt2 = ranNumber;
    MainInt2 += 1;
    
    
    incrementNumberLabel.text = [NSString stringWithFormat:@"%i", MainInt2];
    
}
-(void)countup3{
    
    //incrementing the number
    
   // MainInt3 = ranNumber2;
    MainInt3 += 1;
    
    
    incrementNumberLabel.text = [NSString stringWithFormat:@"%i", MainInt3];
    
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
    
    
    if ([select isEqualToString:@"Go Back To Levels"]){ 
        
        levelLabel.text = @"26";
        
        LevelsView *stages = [[LevelsView alloc] initWithNibName:nil bundle:[NSBundle mainBundle]];
        
        
        
        self.levelString = [levelLabel text];
        [stages setLevelsComplete:self.levelString];
        
        self.tryString = [tryLabel text];
        [stages setGetTryString:self.tryString];
        
        self.loopString = [loopLabel text];
        [stages setGetLoopString:self.loopString];
        
        
        [self presentModalViewController:stages animated:YES];
        
        
    }
    if ([select isEqualToString:@"QUIT"]){ 
        [self backLevels:nil];
        
    }
    if ([select isEqualToString:@"PLAY AGAIN"]){ 
        buttonBack.enabled = YES;
        
        buttonSend.hidden = NO;
        stopButton.hidden = YES;
        stopButton2.hidden = YES;
        stopButton.hidden = YES;
        
        incrementNumberLabel.font = [UIFont fontWithName:@"Chalkduster" size:80]; 
        restartLabel.font = [UIFont systemFontOfSize:17];
        restartLabel.textColor = [UIColor blackColor];
        
               ranNumber = [self getRandomNumberBetweenMin:15 andMax:20];
        
        randomNumberLabel.text = [[NSString alloc] initWithFormat:@"%d", ranNumber] ;
        incrementNumberLabel.text = @"Ready?";

        tryNumber += 1;
        tryLabel.text = [[NSString alloc] initWithFormat:@"Try #: %d", tryNumber];
    }
    
    
}

-(int) getRandomNumberBetweenMin:(int)min andMax:(int)max//sets random number min and max numbers
{
	return ( (arc4random() % (max-min+1)) + min );
}


- (void)viewDidLoad
{
    
  //  buttonImage.hidden = YES;
    
    MainInt = 0;
    
    
    ranNumber = [self getRandomNumberBetweenMin:15 andMax:20];
    
    
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