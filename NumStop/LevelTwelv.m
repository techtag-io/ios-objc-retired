//
//  LevelTwelv.m
//  NumStop
//
//  Created by Travis McGowan on 6/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LevelTwelv.h"
#import "LevelsView.h"

@interface LevelTwelv ()

@end

@implementation LevelTwelv
@synthesize randomNumberLabel,incrementNumberLabel, restartLabel, loopLabel, restartLabel2;
@synthesize tryLabel, levelLabel, incrementNumberLabel2, randomNumberLabel2;
@synthesize buttonSendStop, buttonSendStart,buttonSendStop2;
@synthesize levelString, loopLabel2, stopGlow, stopGlow2;
@synthesize stopBtnImage, stopBtnImage2, startBtnImage, buttonBackToMain;
@synthesize tryString, loopString;



-(IBAction)backLevels:(id)sender{
    //goes back to levels view
    levelLabel.text = @"";
    
    
    [timer invalidate];
    [timer2 invalidate];
    [buttonFlipTimer invalidate];
    [buttonFlipTimer2 invalidate];
    
    LevelsView *stages = [[LevelsView alloc] initWithNibName:nil bundle:[NSBundle mainBundle]];
    
    
    
    
    self.levelString = [levelLabel text];
    [stages setLevelsComplete:self.levelString];
    
    [self presentModalViewController:stages animated:YES];
    
    
    
}


-(IBAction)sendStart:(id)sender{
       buttonBackToMain.enabled = NO;
    
    
    loopNumber = 1;
    loopLabel.text = [[NSString alloc] initWithFormat:@"%d", loopNumber];
    loopNumber2 = 1;
    loopLabel2.text = [[NSString alloc] initWithFormat:@"%d", loopNumber2];
    
    //incrementing timer start
    
    MainInt = 0;
    timer = [NSTimer scheduledTimerWithTimeInterval: 0.08 target:self selector:@selector(countup) userInfo:nil repeats:YES];
    
    MainInt2 = 0;
    timer2 = [NSTimer scheduledTimerWithTimeInterval: 0.08 target:self selector:@selector(countup2) userInfo:nil repeats:YES];
    
    
    restartLabel.hidden = YES;
    restartLabel2.hidden = YES;
    
    [stopBtnImage2 setAlpha:0];
    [UIImageView beginAnimations:nil context:NULL];
    [UIImageView setAnimationDuration:0.4];
    [stopBtnImage2 setAlpha:1];
    [UIImageView commitAnimations];
    
    
    
    [stopBtnImage setAlpha:0];
    [UIImageView beginAnimations:nil context:NULL];
    [UIImageView setAnimationDuration:0.4];
    [stopBtnImage setAlpha:1];
    [UIImageView commitAnimations];
    
    
    
    [startBtnImage setAlpha:1];
    [UIImageView beginAnimations:nil context:NULL];
    [UIImageView setAnimationDuration:0.3];
    [startBtnImage setAlpha:0];
    [UIImageView commitAnimations];
    buttonSendStart.hidden = 1;
    startBtnImage.hidden = 1;
    
    
    stopBtnImage.hidden = 0;
    stopBtnImage2.hidden = 0;
    
    buttonSendStop.hidden = 0;
    buttonSendStop2.hidden = 0;
    
    restartLabel.textColor = [UIColor blackColor];
    restartLabel2.textColor = [UIColor blackColor];
    
    [stopBtnImage setImage:[UIImage imageNamed:@"redbtnunpress.PNG"]];
    [stopBtnImage2 setImage:[UIImage imageNamed:@"redbtnunpress.PNG"]]; 
    
    
    
    buttonFlipTimer = [NSTimer scheduledTimerWithTimeInterval: 0.12 target:self selector:@selector(buttonFlipCount) userInfo:nil repeats:YES];
    buttonFlipTimer2 = [NSTimer scheduledTimerWithTimeInterval: 0.12 target:self selector:@selector(buttonFlipCount2) userInfo:nil repeats:YES];
    
    
    
}
-(IBAction)sendStop:(id)sender{
    incrementNumberLabel.font = [UIFont fontWithName:@"Chalkduster" size:80];
    //--check if incremented number is smaller, larger or equal to the random number
    
    if(MainInt == ranNumber ){
        [stopBtnImage setImage:[UIImage imageNamed:@"bluebtnunpress.PNG"]];
        
        
        
        incrementNumberLabel.text = @"PASS";
        
        
        if ([incrementNumberLabel2.text isEqualToString:@"PASS"]){
            UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"LEVEL PASSED" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"Play Again", @"Next Level",  nil];
            [msg show];
        }
        
        
        else if ([incrementNumberLabel2.text isEqualToString:@"SLOW"] || [incrementNumberLabel2.text isEqualToString:@"FAST"]){
            
            MainInt2 = 0;
            timer2 = [NSTimer scheduledTimerWithTimeInterval: 0.08 target:self selector:@selector(countuplast2) userInfo:nil repeats:YES];
            
            buttonFlipTimer2 = [NSTimer scheduledTimerWithTimeInterval: 0.12 target:self selector:@selector(buttonFlipCount2) userInfo:nil repeats:YES];
            
            ranNumber2 = [self getRandomNumberBetweenMin:100 andMax:120];
            
            randomNumberLabel2.text = [[NSString alloc] initWithFormat:@"%d", ranNumber2] ;
            [stopBtnImage2 setImage:[UIImage imageNamed:@"redbtnunpress.PNG"]];
        }
        
    }
    
    
    //////////////////////////////////increment number larger than random
    else if (MainInt > ranNumber) {
        [stopBtnImage setImage:[UIImage imageNamed:@"redbtnfail.PNG"]];
        
        
        incrementNumberLabel.text= @"SLOW";
        
        
        
        if ([incrementNumberLabel2.text isEqualToString:@"SLOW"] || [incrementNumberLabel2.text isEqualToString:@"FAST"] || [incrementNumberLabel2.text isEqualToString:@"PASS"]){
            UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"Level Failed" message:nil delegate:self cancelButtonTitle:@"Quit" otherButtonTitles:@"Restart", nil];
            [msg show];
        }
        
        
    }
    
    //////////////////////////////////increment number smaller than random
    else if (MainInt < ranNumber) {
        [stopBtnImage setImage:[UIImage imageNamed:@"redbtnfail.PNG"]];
        
        
        
        incrementNumberLabel.text= @"FAST";
        
        
        
        if ([incrementNumberLabel2.text isEqualToString:@"PASS"] || [incrementNumberLabel2.text isEqualToString:@"SLOW"] || [incrementNumberLabel2.text isEqualToString:@"FAST"]){
            UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"Level Failed" message:nil delegate:self cancelButtonTitle:@"Quit" otherButtonTitles:@"Restart", nil];
            [msg show];
            
            
        }
        
        
        
    }
    
    
    
    
    
    
    //restart labwl is hiddwn and the timer is stopped
    
    restartLabel.hidden = YES;
    
    [timer invalidate];
    [buttonFlipTimer invalidate];
    stopGlow.hidden = 1;
    
    buttonFlipInt = 1;
    
    
    
    
    
}
-(IBAction)sendStop2:(id)sender{
    incrementNumberLabel2.font = [UIFont fontWithName:@"Chalkduster" size:80];
    
    //--check if incremented number is smaller, larger or equal to the random number
    
    if(MainInt2 == ranNumber2 ){
        [stopBtnImage2 setImage:[UIImage imageNamed:@"bluebtnunpress.PNG"]];
        
        incrementNumberLabel2.text= @"PASS";
        if ([incrementNumberLabel.text isEqualToString:@"PASS"]){
            UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"LEVEL PASSED" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"Play Again", @"Next Level",  nil];
            [msg show];
        }
        else if ([incrementNumberLabel.text isEqualToString:@"SLOW"] || [incrementNumberLabel.text isEqualToString:@"FAST"]){
            
            MainInt = 0;
            timer = [NSTimer scheduledTimerWithTimeInterval: 0.08 target:self selector:@selector(countuplast) userInfo:nil repeats:YES];
            
            buttonFlipTimer = [NSTimer scheduledTimerWithTimeInterval: 0.12 target:self selector:@selector(buttonFlipCount) userInfo:nil repeats:YES];
            
            ranNumber = [self getRandomNumberBetweenMin:110 andMax:120];
            
            randomNumberLabel.text = [[NSString alloc] initWithFormat:@"%d", ranNumber] ;
            
            [stopBtnImage setImage:[UIImage imageNamed:@"redbtnunpress.PNG"]];
        }
        
        
        
    }
    else if (MainInt2 > ranNumber2) {
        [stopBtnImage2 setImage:[UIImage imageNamed:@"redbtnfail.PNG"]];
        
        
        incrementNumberLabel2.text= @"SLOW";
        
        if ([incrementNumberLabel.text isEqualToString:@"PASS"] || [incrementNumberLabel.text isEqualToString:@"FAST"] || [incrementNumberLabel.text isEqualToString:@"SLOW"]){
            UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"Level Failed" message:nil delegate:self cancelButtonTitle:@"Quit" otherButtonTitles:@"Restart", nil];
            [msg show];
        }
        
        
    }
    else if (MainInt2 < ranNumber2) {
        [stopBtnImage2 setImage:[UIImage imageNamed:@"redbtnfail.PNG"]];
        
        incrementNumberLabel2.text= @"FAST";
        if ([incrementNumberLabel.text isEqualToString:@"PASS"] || [incrementNumberLabel.text isEqualToString:@"FAST"] || [incrementNumberLabel.text isEqualToString:@"SLOW"]){
            UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"Level Failed" message:nil delegate:self cancelButtonTitle:@"Quit" otherButtonTitles:@"Restart", nil];
            [msg show];
        }
        
    }
    
    
    
    
    
    //restart labwl is hiddwn and the timer is stopped
    
    restartLabel2.hidden = YES;
    
    [timer2 invalidate];
    [buttonFlipTimer2 invalidate];
    stopGlow2.hidden = 1;
    
    buttonFlipInt2 = 1;
    
    
}

///// timer codes start

// timer for main number to increment
-(void)countup{
    
    incrementNumberLabel.font = [UIFont fontWithName:@"DBLCDTempBlack" size:80];
    
    
    //incrementing the number
    
    MainInt += 1;
    // restartLabel.textColor = [UIColor blackColor];
    
    
    incrementNumberLabel.text = [NSString stringWithFormat:@"%i", MainInt];
    
    
    if(MainInt == ranNumber+2){
        
        restartLabel.hidden = NO;
        restartLabel.text = @"Restart:\n3";
    }
    else if(MainInt == ranNumber+3){
        restartLabel.text = @"Restart:\n2";
    }
    else if(MainInt == ranNumber+4){
        restartLabel.text = @"Restart:\n1";
    }
    
    
    if(MainInt >= ranNumber+5){
        
        restartLabel.hidden = YES;
        MainInt = 0;
        
        //shows how many times the timer looped
        
        loopNumber +=1;
        loopLabel.text = [[NSString alloc] initWithFormat:@"%d", loopNumber];
        
        if(loopNumber >= 5 && loopNumber <= 7){
            restartLabel.textColor = [UIColor orangeColor];
        }
        
        else if(loopNumber >=8 && loopNumber <= 9){
            
            restartLabel.textColor = [UIColor redColor];
            
        }
        
        
    }
    else if (MainInt == ranNumber+1){
        if (loopNumber == 10){
            UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"Come On!"
                                                          message:@"You lapped 10 times!"
                                                         delegate:self
                                                cancelButtonTitle:@"Play Again"
                                                otherButtonTitles:@"Quit", nil];
            [msg show];
            
            [buttonFlipTimer invalidate];
            [timer invalidate];
            [buttonFlipTimer2 invalidate];
            [timer2 invalidate];
            buttonFlipInt = 1;
            buttonFlipInt2 = 1;
            
        }
    }
    
    
}
-(void)countup2{
    incrementNumberLabel2.font = [UIFont fontWithName:@"DBLCDTempBlack" size:80];
    
    //incrementing the number
    
    
    MainInt2 += 1;
    // restartLabel2.textColor = [UIColor blackColor];
    
    
    incrementNumberLabel2.text = [NSString stringWithFormat:@"%i", MainInt2];
    
    if(MainInt2 == ranNumber2+2){
        
        restartLabel2.hidden = NO;
        restartLabel2.text = @"Restart:\n3";
    }
    else if(MainInt2 == ranNumber2+3){
        restartLabel2.text = @"Restart:\n2";
    }
    else if(MainInt2 == ranNumber2+4){
        restartLabel2.text = @"Restart:\n1";
    }
    
    
    if(MainInt2 >= ranNumber2+5){
        
        restartLabel2.hidden = YES;
        MainInt2 = 0;
        
        //shows how many times the timer looped
        
        loopNumber2 +=1;
        loopLabel2.text = [[NSString alloc] initWithFormat:@"%d", loopNumber2];
        
        if(loopNumber2 >= 5 && loopNumber2 <= 7){
            restartLabel2.textColor = [UIColor orangeColor];
        }
        
        else if(loopNumber2 >=8 && loopNumber2 <= 9){
            
            restartLabel2.textColor = [UIColor redColor];
            
        }
        
        
    }
    else if (MainInt2 == ranNumber2+1){
        if (loopNumber2 == 10){
            UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"Come On!"
                                                          message:@"You lapped 10 times!"
                                                         delegate:self
                                                cancelButtonTitle:@"Play Again"
                                                otherButtonTitles:@"Quit", nil];
            [msg show];
            
            [buttonFlipTimer2 invalidate];
            [timer2 invalidate];
            [buttonFlipTimer invalidate];
            [timer invalidate];
            buttonFlipInt = 1;
            buttonFlipInt2 = 1;
        }
    }
    
    
}


//timer for button color to change while main int is being incremented
-(void)buttonFlipCount{
    
    buttonFlipInt += 1;
    stopGlow.hidden = 0;
    
    int flipCount = buttonFlipInt %2;
    
    if (flipCount == 0){
        stopGlow.hidden = 0;
        
    }
    else {
        stopGlow.hidden = 1;
        
    }
    
}
-(void)buttonFlipCount2{
    buttonFlipInt2 += 1;
    stopGlow2.hidden = 0;
    
    int flipCount2 = buttonFlipInt2 %2;
    
    if (flipCount2 == 0){
        stopGlow2.hidden = 0;
        
    }
    else {
        stopGlow2.hidden = 1;
        
    }
}

// timer for last 3 loops if first number is failed and second is passed
-(void)countuplast{
    incrementNumberLabel.font = [UIFont fontWithName:@"DBLCDTempBlack" size:80];
    
    
    MainInt += 1;
    // restartLabel.textColor = [UIColor blackColor];
    
    
    incrementNumberLabel.text = [NSString stringWithFormat:@"%i", MainInt];
    
    
    if(MainInt >= ranNumber+3){
        
        restartLabel.hidden = YES;
        MainInt = 0;
        
        //shows how many times the timer looped
        
        loopNumber +=1;
        loopLabel.text = [[NSString alloc] initWithFormat:@"%d", loopNumber];
        
        if (loopNumber == 3){
            UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"Level Failed" message:nil delegate:self cancelButtonTitle:@"Quit" otherButtonTitles:@"Restart", nil];
            [msg show];
            
            [buttonFlipTimer invalidate];
            [timer invalidate];
            
        }
    }
    
    
}
-(void)countuplast2{
    incrementNumberLabel2.font = [UIFont fontWithName:@"DBLCDTempBlack" size:80];
    
    
    MainInt2 += 1;
    // restartLabel.textColor = [UIColor blackColor];
    
    
    incrementNumberLabel2.text = [NSString stringWithFormat:@"%i", MainInt2];
    
    
    if(MainInt2 >= ranNumber2+3){
        
        restartLabel2.hidden = YES;
        MainInt2 = 0;
        
        //shows how many times the timer looped
        
        
        loopNumber2 +=1;
        loopLabel2.text = [[NSString alloc] initWithFormat:@"%d", loopNumber2];
        
        if (loopNumber2 == 3){
            UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"Level Failed" message:nil delegate:self cancelButtonTitle:@"Quit" otherButtonTitles:@"Restart", nil];
            [msg show];
            
            [buttonFlipTimer2 invalidate];
            [timer2 invalidate];
            
        }
    }
    
    
}

////// timer codes end



-(void) alertView :(UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    //alert view responses
    
    NSString *select = [alertView buttonTitleAtIndex: buttonIndex];
    
    
    if ([select isEqualToString:@"Next Level"]){ 
        if(loopNumber > loopNumber2){
            loopLabel.text = [NSString stringWithFormat:@"Loop #: %d", loopNumber];
            
        }
        else if (loopNumber <= loopNumber2){
            loopLabel.text = [NSString stringWithFormat:@"Loop #: %d", loopNumber2];
        }
        
        //goes to next level
        levelLabel.text = @"13";
        
        LevelsView *stages = [[LevelsView alloc] initWithNibName:nil bundle:[NSBundle mainBundle]];
        
        
        
        self.levelString = [levelLabel text];
        [stages setLevelsComplete:self.levelString];
        
        self.tryString = [tryLabel text];
        [stages setGetTryString:self.tryString];
        
        self.loopString = [loopLabel text];
        [stages setGetLoopString:self.loopString];
        
        
        [self presentModalViewController:stages animated:YES];
        
        
    }
    if ([select isEqualToString:@"Quit"]){ 
        
        //goes back to levels view
        [self backLevels:nil];
        
        
        
    }
    if ([select isEqualToString:@"Play Again"] || [select isEqualToString:@"Restart"]){ 
           buttonBackToMain.enabled = YES;
        //resets all timers, put out new random numbers, sets all fonts and colors
        
        [buttonFlipTimer invalidate];
        [buttonFlipTimer2 invalidate];
        
        ranNumber = [self getRandomNumberBetweenMin:110 andMax:120];
        
        randomNumberLabel.text = [[NSString alloc] initWithFormat:@"%d", ranNumber] ;
        incrementNumberLabel.text = @"Ready?";
        
        loopNumber = 1;
        loopLabel.text = [[NSString alloc] initWithFormat:@"%d", loopNumber];
        
        ranNumber2 = [self getRandomNumberBetweenMin:100 andMax:130];
        
        randomNumberLabel2.text = [[NSString alloc] initWithFormat:@"%d", ranNumber2] ;
        incrementNumberLabel2.text = @"Ready?";
        
        loopNumber2 = 1;
        loopLabel2.text = [[NSString alloc] initWithFormat:@"%d", loopNumber2];
        
        
        /////////
        
        [stopBtnImage2 setAlpha:1];
        [UIImageView beginAnimations:nil context:NULL];
        [UIImageView setAnimationDuration:0.4];
        [stopBtnImage2 setAlpha:0];
        [UIImageView commitAnimations];
        
        
        
        [stopBtnImage setAlpha:1];
        [UIImageView beginAnimations:nil context:NULL];
        [UIImageView setAnimationDuration:0.4];
        [stopBtnImage setAlpha:0];
        [UIImageView commitAnimations];
        
        
        
        [startBtnImage setAlpha:0];
        [UIImageView beginAnimations:nil context:NULL];
        [UIImageView setAnimationDuration:0.3];
        [startBtnImage setAlpha:1];
        [UIImageView commitAnimations];
        buttonSendStart.hidden = 0;
        startBtnImage.hidden = 0;
        
        
        stopBtnImage.hidden = 1;
        stopBtnImage2.hidden = 1;
        
        buttonSendStop.hidden = 1;
        buttonSendStop2.hidden = 1;
        
        stopGlow.hidden = 1;
        stopGlow2.hidden = 1;
        
        incrementNumberLabel.font = [UIFont fontWithName:@"Chalkduster" size:80];
        incrementNumberLabel2.font = [UIFont fontWithName:@"Chalkduster" size:80];
        
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
       buttonBackToMain.enabled = YES;
    incrementNumberLabel.font = [UIFont fontWithName:@"Chalkduster" size:80];
    incrementNumberLabel2.font = [UIFont fontWithName:@"Chalkduster" size:80];
    
    
    
    MainInt = 0;
    MainInt2 = 0;
    
    ranNumber = [self getRandomNumberBetweenMin:110 andMax:120];
    ranNumber2 =[self getRandomNumberBetweenMin:100 andMax:130];
    
    
    randomNumberLabel.text = [[NSString alloc] initWithFormat:@"%d", ranNumber] ;
    randomNumberLabel2.text = [[NSString alloc] initWithFormat:@"%d", ranNumber2] ;
    
    tryNumber = 1;
    tryLabel.text = [[NSString alloc] initWithFormat:@"Try #: %d", tryNumber];
    
    
    
    
    /* UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"GOOD JOB!"
     message:@"Level 6 Complete"
     delegate:self
     cancelButtonTitle:@"Play Again"
     otherButtonTitles:@"Next Level", nil];
     [msg show];*/
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    self.randomNumberLabel = nil;
    self.randomNumberLabel2 = nil;
    self.incrementNumberLabel = nil;
    self.incrementNumberLabel2 = nil;
    self.restartLabel = nil;
    self.restartLabel2 = nil;
    self.loopLabel = nil;
    self.loopLabel2 = nil;
    self.tryLabel = nil;
    self.levelLabel = nil;
    self.buttonSendStop = nil;
    self.buttonSendStop2 = nil;
    self.buttonSendStart = nil;
    self.levelString = nil;
    self.levelLabel = nil;
    self.stopBtnImage = nil;
    self.stopBtnImage2 = nil;
    self.startBtnImage = nil;
    self.stopGlow = nil;
    self.stopGlow2 = nil;
    
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}





@end
