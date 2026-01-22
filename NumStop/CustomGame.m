//
//  CustomGame.m
//  NumStop
//
//  Created by Travis McGowan on 6/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomGame.h"
#import "ViewController.h"

@interface CustomGame ()

@end

@implementation CustomGame
@synthesize randomView, exactView, maxNum, gameView, mainView;
@synthesize randomSelector,minNum, ranNum, dismissKeyboardLabel, speedLabel, speedSlider;
@synthesize randomNumberLabel, incrementNumberLabel, restartLabel, loopLabel, labelSwitch;
@synthesize tryLabel, buttonGlow, buttonSend, buttonImage, quitBtn, keyboardDismissBtn;






-(IBAction)backMain:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
}
-(IBAction)playGame:(id)sender{

    

            if (randomSelector.selectedSegmentIndex == 0){
                   if([minNum.text isEqualToString:@""] || [maxNum.text isEqualToString:@""]){
                       
                       UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"Please fill in all fields" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                       [msg show];
                   }
                   else {
                       if(maxNum.text.integerValue < minNum.text.integerValue){
                           UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"Highest number must be larger than the Lowest number" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                           [msg show];
                       }
                       else{
            ranNumber = [self getRandomNumberBetweenMin:minNum.text.integerValue andMax:maxNum.text.integerValue];
            
            
            randomNumberLabel.text = [[NSString alloc] initWithFormat:@"%d", ranNumber] ;
            
                       [UIView beginAnimations:nil context:NULL];
                       [UIView setAnimationDuration:0.5];
                       [gameView setAlpha:0.0];
                       [gameView setAlpha:1];
                       [UIView commitAnimations];
                       
                       
                       
            self.view = self.gameView;
                       [self buttonStartGame:nil];
                       }
            }
            }
       
            else if (randomSelector.selectedSegmentIndex == 1){
                if([ranNum.text isEqualToString:@""]){
                    UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"Please fill in all fields" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                    [msg show];
                }
                else {
                //code for exact number view
                ranNumber = ranNum.text.integerValue;
                randomNumberLabel.text = [[NSString alloc] initWithFormat:@"%d", ranNumber] ;
                    [UIView beginAnimations:nil context:NULL];
                    [UIView setAnimationDuration:0.5];
                    [gameView setAlpha:0.0];
                    [gameView setAlpha:1];
                    [UIView commitAnimations];
                    
                self.view = self.gameView;
                    [self buttonStartGame:nil];
            }
        }

}

-(IBAction)buttonStartGame:(id)sender{
    quitBtn.enabled = YES;
    [buttomFlipTimer invalidate];
    
    
    
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

    incrementNumberLabel.font = [UIFont fontWithName:@"DBLCDTempBlack" size:80];
}

-(IBAction)backMainView:(id)sender{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    [mainView setAlpha:0.0];
    [mainView setAlpha:1];
    [UIView commitAnimations];
    
    self.view = self.mainView;
    [timer invalidate];
    [buttomFlipTimer invalidate];
    randomNumberLabel.text = @"";
    incrementNumberLabel.text = @"";
    loopLabel.text = @"Loop #: 0";
    tryLabel.text = @"Try #: 0";
    quitBtn.enabled = YES;
}


-(IBAction)randomChoose:(id)sender{
    if(randomSelector.selectedSegmentIndex == 0){
        randomView.hidden = NO;
        exactView.hidden = YES;
        
    }
    if(randomSelector.selectedSegmentIndex == 1){
        randomView.hidden = YES;
        exactView.hidden = NO;
    }
    
}

-(IBAction)changeSpeed:(id)sender{
    speedSlider.minimumValue = 0.001;
    speedSlider.maximumValue = 2.000;
    gameSpeed = (speedSlider.value);
 
    speedLabel.text = [NSString stringWithFormat:@"%.3f", gameSpeed ];
    
   
}

-(IBAction)dismissKeyboard{
    [ranNum resignFirstResponder];
    [minNum resignFirstResponder];
    [maxNum resignFirstResponder];
    
    dismissKeyboardLabel.hidden = YES;
    randomSelector.hidden = NO;
    keyboardDismissBtn.hidden = YES;
}

- (void)keyboardWillShow:(NSNotification *)note {
    dismissKeyboardLabel.hidden = NO;
    randomSelector.hidden = YES;
    keyboardDismissBtn.hidden = NO;
}










-(IBAction)send:(id)sender{
    
    //label switches from start to stop to start
    
    
    if([labelSwitch.text isEqualToString: @"START"]){
        quitBtn.enabled = NO;

        buttomFlipTimer = [NSTimer scheduledTimerWithTimeInterval: 0.12 target:self selector:@selector(buttonFlipCount) userInfo:nil repeats:YES];
        
        
        
     
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
        timer = [NSTimer scheduledTimerWithTimeInterval: gameSpeed target:self selector:@selector(countup) userInfo:nil repeats:YES];
        
        labelSwitch.text = @"STOP";
        restartLabel.hidden = YES;
        incrementNumberLabel.font = [UIFont fontWithName:@"DBLCDTempBlack" size:80];
        
        
        
        
    }
    else if([labelSwitch.text isEqualToString: @"STOP"]){
        quitBtn.enabled = YES;
        [buttomFlipTimer invalidate];
        
        
   
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
                                                          message:nil
                                                         delegate:self
                                                cancelButtonTitle:@"PLAY AGAIN"
                                                otherButtonTitles:@"QUIT", nil];
            [msg show];
            
            
            
        }
        else if (MainInt > ranNumber) {
            
            UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"TOO SLOW!"
                                                          message:@"Wake Up!"
                                                         delegate:self
                                                cancelButtonTitle:@"PLAY AGAIN"
                                                otherButtonTitles:@"QUIT",nil];
            [msg show];
            
            
        }
        else if (MainInt < ranNumber) {
            
            UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"TOO FAST!"
                                                          message:@"Patience My Friend"
                                                         delegate:self
                                                cancelButtonTitle:@"PLAY AGAIN"
                                                otherButtonTitles:@"QUIT", nil];
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
            
           
            
            
            [timer invalidate];
            UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"Come On!"
                                                          message:@"You lapped 10 times!"
                                                         delegate:self
                                                cancelButtonTitle:@"PLAY AGAIN"
                                                otherButtonTitles:@"QUIT", nil];
            [msg show];
        }
        
    }
    
    
}

-(void)buttonFlipCount{
    buttonFlipInt += 1;
    buttonImage.hidden = 0;
    
    int flipCount = buttonFlipInt %2;
    
    if (flipCount == 0){
        
        [buttonGlow setAlpha:0];
        [UIImageView beginAnimations:nil context:NULL];
        [UIImageView setAnimationDuration:.7];
        [buttonGlow setAlpha:1];
        [UIImageView commitAnimations];
        
        buttonGlow.hidden = 0;
        
    }
    else {
        [buttonGlow setAlpha:1];
        [UIImageView beginAnimations:nil context:NULL];
        [UIImageView setAnimationDuration:.7];
        [buttonGlow setAlpha:0];
        [UIImageView commitAnimations];
        
        //  buttonGlow.hidden = 1;
        
    }
    
    
}


-(void) alertView :(UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    //alert view responses
    
    NSString *select = [alertView buttonTitleAtIndex: buttonIndex];

    if ([select isEqualToString:@"PLAY AGAIN"]){ 
       
        
        if (randomSelector.selectedSegmentIndex == 0){
            if([minNum.text isEqualToString:@""] || [maxNum.text isEqualToString:@""]){
                
                UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"Please fill in all fields" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [msg show];
            }
            else {
                ranNumber = [self getRandomNumberBetweenMin:minNum.text.integerValue andMax:maxNum.text.integerValue];
                
                
                randomNumberLabel.text = [[NSString alloc] initWithFormat:@"%d", ranNumber] ;
                
          
                
              
            }
        }
        
        else if (randomSelector.selectedSegmentIndex == 1){
            if([ranNum.text isEqualToString:@""]){
                UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"Please fill in all fields" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [msg show];
            }
            else {
                //code for exact number view
                ranNumber = ranNum.text.integerValue;
                randomNumberLabel.text = [[NSString alloc] initWithFormat:@"%d", ranNumber] ;
                
              
            }
        }
        MainInt = 0;
        incrementNumberLabel.text = [[NSString alloc] initWithFormat:@"%d", MainInt];
 [self buttonStartGame:nil];
        
        tryNumber +=1;
        tryLabel.text = [NSString stringWithFormat:@"Try #: %d", tryNumber];

    }
    if ([select isEqualToString:@"QUIT"]){ 
   
        [self backMainView:nil];
    }
    
    
}

-(int) getRandomNumberBetweenMin:(int)min andMax:(int)max//sets random number min and max numbers
{
	return ( (arc4random() % (max-min+1)) + min );
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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(keyboardWillShow:) 
                                                 name:UIKeyboardWillShowNotification 
                                               object:nil];
    
    
    MainInt = 0;
    
    
    
    
    
    tryNumber = 1;
    tryLabel.text = [[NSString alloc] initWithFormat:@"Try #: %d", tryNumber];
    

      
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}






@end
