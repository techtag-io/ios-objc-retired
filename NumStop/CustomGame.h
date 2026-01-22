//
//  CustomGame.h
//  NumStop
//
//  Created by Travis McGowan on 6/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomGame : UIViewController{
    UIView *randomView;
    UIView *exactView;
    
    UISegmentedControl *randomSelector;
    UIButton *playButton;

    UITextField *minNum;
    UITextField *maxNum;
    UITextField *ranNum;
    
    UILabel *dismissKeyboardLabel;
    UILabel *speedLabel;
    UISlider *speedSlider;


    
    
    UILabel *randomNumberLabel; // label that shows the random number
    NSTimer *timer; //timer to time the incrementing number
    int MainInt; //integer to be incremented
    
    NSTimer *buttomFlipTimer;
    int buttonFlipInt;
    
    
    UILabel *incrementNumberLabel; //label that shows the incrementing number
    UILabel *restartLabel; //label that shows the "count down" to restart the incrementing loop
    UILabel *loopLabel; //label that shows the loop count
    
    UILabel *labelSwitch; //switches from start to stop to start upon button click
    int ranNumber; //random number integer
    int loopNumber; //loop number integer
    int tryNumber;
    int playSpeed;
    float gameSpeed ;
    

    
    UILabel *tryLabel;

    UIButton *buttonSend;
 
    
    UIImageView *buttonGlow;
    UIImageView *buttonImage;
    
    UIView *mainView;
    UIView *gameView;
    UIButton *quitBtn;
    UIButton *keyboardDismissBtn;
}
@property (nonatomic, retain) IBOutlet UIButton *keyboardDismissBtn;
@property (nonatomic, retain) IBOutlet UIButton *quitBtn;


@property (nonatomic, retain) IBOutlet UIView *mainView;
@property (nonatomic, retain) IBOutlet UIView *gameView;

@property (nonatomic, retain) IBOutlet UIImageView *buttonImage;
@property (nonatomic, retain) IBOutlet UIImageView *buttonGlow;
@property (nonatomic, retain) IBOutlet UIButton *buttonSend;


@property (nonatomic, retain) IBOutlet UILabel *tryLabel;


@property (nonatomic, retain) IBOutlet UILabel *loopLabel;//connect loop label
@property (nonatomic, retain) IBOutlet UILabel *restartLabel;//connect restart label
@property(nonatomic, retain) IBOutlet UILabel *labelSwitch;
@property (nonatomic, retain) IBOutlet UILabel *incrementNumberLabel;//connect increm num label
@property (nonatomic, retain) IBOutlet UILabel *randomNumberLabel; //connect random label


-(IBAction)send:(id)sender; //starts and stops the incrementation
-(void)countup; // code to increment the numbers


-(void)buttonFlipCount;


    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
-(IBAction)buttonStartGame:(id)sender;
    
    
    
@property (nonatomic, retain) IBOutlet UISlider *speedSlider;
@property (nonatomic, retain) IBOutlet UILabel *speedLabel;
@property (nonatomic, retain) IBOutlet UILabel *dismissKeyboardLabel;

@property (nonatomic, retain) IBOutlet UIView *randomView;
@property (nonatomic, retain) IBOutlet UIView *exactView;
@property (nonatomic, retain) IBOutlet UISegmentedControl *randomSelector;

@property (nonatomic, retain) IBOutlet UITextField *minNum;
@property (nonatomic, retain) IBOutlet UITextField *maxNum;
@property (nonatomic, retain) IBOutlet UITextField *ranNum;

-(IBAction)backMain:(id)sender;
-(IBAction)playGame:(id)sender;
-(IBAction)randomChoose:(id)sender;

-(IBAction)dismissKeyboard;
-(IBAction)changeSpeed:(id)sender;
-(IBAction)backMainView:(id)sender;
@end
