//
//  LevelTwenty.h
//  NumStop
//
//  Created by Travis McGowan on 6/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LevelTwenty : UIViewController{
    
    
    NSString *levelString;
    NSString *tryString;
    NSString *loopString;
    
    
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
    
    UILabel *tryLabel;
    UILabel *levelLabel;
    UIButton *buttonSend;
    UIButton *buttonBack;
    UIImageView *buttonImage;
    UIImageView *buttonGlow;
}
@property(nonatomic, retain) NSString *tryString;
@property(nonatomic, retain) NSString *loopString;

@property (nonatomic, retain) IBOutlet UIImageView *buttonGlow;
@property (nonatomic, retain) IBOutlet UIImageView *buttonImage;
@property (nonatomic, retain) IBOutlet UIButton *buttonBack;
@property (nonatomic, retain) IBOutlet UIButton *buttonSend;
@property (nonatomic, retain) NSString *levelString;
@property (nonatomic, retain) IBOutlet UILabel *levelLabel;

@property (nonatomic, retain) IBOutlet UILabel *tryLabel;


@property (nonatomic, retain) IBOutlet UILabel *loopLabel;//connect loop label
@property (nonatomic, retain) IBOutlet UILabel *restartLabel;//connect restart label
@property(nonatomic, retain) IBOutlet UILabel *labelSwitch;
@property (nonatomic, retain) IBOutlet UILabel *incrementNumberLabel;//connect increm num label
@property (nonatomic, retain) IBOutlet UILabel *randomNumberLabel; //connect random label


-(IBAction)send:(id)sender; //starts and stops the incrementation
-(void)countup; // code to increment the numbers
-(IBAction)backLevels:(id)sender; // goes back to levels view


-(void)buttonFlipCount;



@end
