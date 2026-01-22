//
//  iPadViewController.h
//  iLookLikeiOS7
//
//  Created by SpidrWeb on 8/30/13.
//  Copyright (c) 2013 BrainGears Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MessageUI/MessageUI.h>
#import <Social/Social.h>
#import <QuartzCore/QuartzCore.h>
#import "UIImage+ImageEffects.h"

@interface iPadViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate>{
    
    SLComposeViewController *slComposeViewController;
    
    NSTimer *countDownTimer;
    double countDownInt;
    
    NSTimer *cameraShootTimer;
    double camShootTimerDouble;
    
    
    
    int randomDiscusting; // random discusting image
    int randomCute; // random cute image
    int randomAmountCute; //random amount of cute images before disgusting image
    
    
    NSTimer *flipImageTimer;
    double flipImageDouble;
    double tempDouble;
    
    AVCaptureSession *session;
    
    
    NSMutableArray *chosen_numbers;
    
    NSTimer *shootTimer;
    double shootFloat;
    
    
}


//count down > show image > take picture > load reaction screen
@property(nonatomic, retain) IBOutlet UIView *countDownReactionView;
//count down view
@property(nonatomic, retain) IBOutlet UIView *countDownView;



//app image shown
@property(nonatomic, retain) IBOutlet UIImageView *mainImage;

//reaction view :
//show reaction
@property(nonatomic, retain) IBOutlet UIView *userReactionShareView;
@property(nonatomic, retain) IBOutlet UIImageView *userPicture;
@property(nonatomic, retain) IBOutlet UIImageView *secondMainImage;

//share reaction
-(IBAction)emailReaction:(id)sender;
-(IBAction)fbReaction:(id)sender;
-(IBAction)clipboardReaction:(id)sender;
-(IBAction)cameraRollReaction:(id)sender;
//info share both images
-(IBAction)infoBtnShareBothImages:(id)sender;

@property(nonatomic, retain) IBOutlet UISwitch *shareBothimagesSwitch;
-(IBAction)shareBothImagesSend:(id)sender;
@property(nonatomic, retain) IBOutlet UILabel *yourReactionScreenShotLabel;
@property(nonatomic, retain) IBOutlet UILabel *mainImageScreenShotLabel;
@property(nonatomic, retain) IBOutlet UILabel *developerScreenShotLabel;


//after sharing or sharing skip
-(IBAction)showMoreImages:(id)sender;
-(IBAction)mainMenu:(id)sender;



///printscreen to share image
@property(nonatomic, retain) IBOutlet UIView *printScreenView;
@property(nonatomic, retain) IBOutlet UIImageView *userReactionPrintScreenImage;
@property(nonatomic, retain) IBOutlet UIImageView *mainImagePrintScreenImage;
@property(nonatomic, retain) IBOutlet UIImageView *userReactionSoloPrintScreenImageView;


//import uploaded image
@property(nonatomic, retain) UIImage *img;
@property(nonatomic, retain) NSString *uploadViewString;
@property(nonatomic, retain) NSString *nameString;
@property(nonatomic, retain) IBOutlet UIButton *backButton;
@property(nonatomic, retain) IBOutlet UIButton *showMoreButton;
@property(nonatomic, retain) IBOutlet UIImageView *showMoreIcon;
@property(nonatomic, retain) IBOutlet UIImageView *pleaseHoldWallpaper;

@end

