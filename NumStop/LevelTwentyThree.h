//
//  LevelTwentyThree.h
//  NumStop
//
//  Created by Travis McGowan on 6/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LevelTwentyThree : UIViewController{
    
    NSString *levelString;
    NSString *tryString;
    NSString *loopString;
    
    
    
    NSTimer *buttonFlipTimer;
    NSTimer *buttonFlipTimer2;
    int buttonFlipInt;
    int buttonFlipInt2;
    
    UILabel *randomNumberLabel; // label that shows the random number
    UILabel *randomNumberLabel2; // label that shows the second random number
    
    NSTimer *timer; //timer to time the incrementing number
    int MainInt; //integer to be incremented
    
    NSTimer *timer2;
    int MainInt2;
    
    
    UILabel *incrementNumberLabel; //label that shows the incrementing number
    UILabel *incrementNumberLabel2; //label that shows the second incrementing number
    UILabel *restartLabel; //label that shows the "count down" to restart the incrementing loop
    UILabel *restartLabel2;
    UILabel *loopLabel; //label that shows the loop count
    
    
    int ranNumber; //random number integer
    int ranNumber2;
    int loopNumber; //loop number integer
    int loopNumber2;
    int tryNumber;
    
    UILabel *tryLabel;
    UILabel *levelLabel;
    
    UIButton *buttonSendStart;
    UIButton *buttonSendStop;
    UIButton *buttonSendStop2;
    
    
    UILabel *loopLabel2;
    
    UIImageView *stopGlow;
    UIImageView *stopGlow2;
    
    UIImageView *stopBtnImage;
    UIImageView *stopBtnImage2;
    UIImageView *startBtnImage;
    
    UIButton *buttonBackToMain;
    
}
@property(nonatomic, retain) NSString *tryString;
@property(nonatomic, retain) NSString *loopString;

@property (nonatomic, retain) IBOutlet UIButton *buttonBackToMain;
@property (nonatomic, retain) IBOutlet UIImageView *startBtnImage;
@property (nonatomic, retain) IBOutlet UIImageView *stopBtnImage;
@property (nonatomic, retain) IBOutlet UIImageView *stopBtnImage2;

@property (nonatomic, retain ) IBOutlet UIImageView *stopGlow;
@property (nonatomic, retain) IBOutlet UIImageView *stopGlow2;

@property (nonatomic, retain) NSString *levelString;
@property (nonatomic, retain) IBOutlet UILabel *levelLabel;

@property (nonatomic, retain) IBOutlet UILabel *tryLabel;


@property (nonatomic, retain) IBOutlet UILabel *loopLabel;//connect loop label
@property(nonatomic, retain) IBOutlet UILabel *loopLabel2;
@property (nonatomic, retain) IBOutlet UILabel *restartLabel;//connect restart label
@property (nonatomic, retain) IBOutlet UILabel *restartLabel2;

@property (nonatomic, retain) IBOutlet UILabel *incrementNumberLabel;//connect increm num label
@property (nonatomic, retain) IBOutlet UILabel *incrementNumberLabel2;
@property (nonatomic, retain) IBOutlet UILabel *randomNumberLabel; //connect random label
@property (nonatomic, retain) IBOutlet UILabel *randomNumberLabel2;


@property (nonatomic, retain) IBOutlet UIButton *buttonSendStart;
@property (nonatomic, retain) IBOutlet UIButton *buttonSendStop;
@property (nonatomic, retain) IBOutlet UIButton *buttonSendStop2;

-(IBAction)sendStart:(id)sender; //starts and stops the incrementation
-(IBAction)sendStop:(id)sender;
-(IBAction)sendStop2:(id)sender;

-(void)countup; // code to increment the numbers
-(void)countup2; // code to increment the numbers
-(IBAction)backLevels:(id)sender; // goes back to levels view

-(void)buttonFlipCount;
-(void)buttonFlipCount2;
-(void)countuplast;
-(void)countuplast2;


@end