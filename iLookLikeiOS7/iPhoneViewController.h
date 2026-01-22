//
//  iPhoneViewController.h
//  iLookLikeiOS7
//
//  Created by SpidrWeb on 8/15/13.
//  Copyright (c) 2013 BrainGears Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <MessageUI/MessageUI.h>
#import <Social/Social.h>
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>

@interface iPhoneViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIScrollViewDelegate, MFMailComposeViewControllerDelegate>{
    
    SLComposeViewController *slComposeViewController;
    
    NSTimer *countDownTimer;
    double countDownInt;
    
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
@property(nonatomic, retain) NSString *nameString;
@property(nonatomic, retain) NSString *uploadViewString;
@property(nonatomic, retain) UIImage *img;


@property(nonatomic, retain) IBOutlet UIImageView *viewWallpaper;

//count down > show image > take picture > load reaction screen
@property(nonatomic, retain) IBOutlet UIView *countDownReactionView;

@property(nonatomic, retain) IBOutlet UIView *countDownView;

@property(nonatomic, retain) IBOutlet UIImageView *mainImage;


@property(nonatomic, retain) IBOutlet UIView *userReactionShareView;
@property(nonatomic, retain) IBOutlet UIImageView *userPicture;
@property(nonatomic, retain) IBOutlet UIImageView *secondMainImage;

@property(nonatomic, retain) IBOutlet UIImageView *moreIcon;
-(IBAction)userPictureZoomIn:(id)sender;
//@property(nonatomic, retain) IBOutlet UIButton *picZoomInBtn;
@property(nonatomic, retain) IBOutlet UIScrollView *userPicScrollView;

@property(nonatomic, retain) IBOutlet UIButton *zoomInImageBtn;

//info share both images
-(IBAction)infoBtnShareBothImages:(id)sender;

@property(nonatomic, retain) IBOutlet UISwitch *shareBothimagesSwitch;
-(IBAction)shareBothImagesSend:(id)sender;
@property(nonatomic, retain) IBOutlet UILabel *yourReactionScreenShotLabel;
@property(nonatomic, retain) IBOutlet UILabel *mainImageScreenShotLabel;
@property(nonatomic, retain) IBOutlet UILabel *developerScreenShotLabel;


///printscreen to share image
@property(nonatomic, retain) IBOutlet UIView *printScreenView;
@property(nonatomic, retain) IBOutlet UIImageView *userReactionPrintScreenImage;
@property(nonatomic, retain) IBOutlet UIImageView *mainImagePrintScreenImage;
@property(nonatomic, retain) IBOutlet UIImageView *userReactionSoloPrintScreenImageView;


-(IBAction)emailReaction:(id)sender;
-(IBAction)fbReaction:(id)sender;
-(IBAction)clipboardReaction:(id)sender;
-(IBAction)cameraRollReaction:(id)sender;

-(IBAction)goAgain:(id)sender;
///back to main menu
-(IBAction)mainMenu:(id)sender;

//@property (nonatomic, retain) IBOutlet UIButton *cameraRollBtn;
//@property (nonatomic, retain) IBOutlet UIButton *copyBtn;
//@property (nonatomic, retain) IBOutlet UIButton *mailBtn;
//@property (nonatomic, retain) IBOutlet UIButton *fbBtn;

@property(nonatomic, retain) IBOutlet  UIView *iPhoneView;

//@property(nonatomic, retain) IBOutlet UIButton *goBackButton;
@property(nonatomic, retain) IBOutlet UIButton *showMoreButton;

@property(nonatomic, retain) IBOutlet UIImageView *pleaseHoldWallpaper;
@property(nonatomic, retain) IBOutlet UILabel *pleaseHoldLabel;

@property(nonatomic, retain) IBOutlet UIImageView *iconPrintScreenWallpaper;
@property(nonatomic, retain) IBOutlet UIImageView *iconMainWallpaper;
@property(nonatomic, retain) IBOutlet UIView *buttonsView;


@end
