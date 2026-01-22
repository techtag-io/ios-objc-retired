//
//  UploadiPhoneViewController.h
//  iLookLikeiOS7
//
//  Created by SpidrWeb on 9/1/13.
//  Copyright (c) 2013 BrainGears Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iPhoneViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <QuartzCore/QuartzCore.h>

@interface UploadiPhoneViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>{
    
    
    UIImageView *myImage;
    BOOL newMedia;
    
    
    NSTimer *shakeTimer;
    int backgroundColorInt;
    
    NSTimer *resetViewtimer;
    int resetInt;
    
    NSString *randomString;
    
    UITextField *nameField;
    
    
    
}
@property(nonatomic, retain) IBOutlet UIView *startView;
-(IBAction)startShowFriend:(id)sender;

@property(nonatomic, retain) IBOutlet UIView *mainView;
- (IBAction)useCameraRoll;
-(IBAction)useCamera;


//after upload
@property (nonatomic, retain) IBOutlet UIImageView *myImage;
@property(nonatomic, retain)IBOutlet UIView *previewView;
-(IBAction)cancelUploadedImage:(id)sender;
-(IBAction)useUploadedImage:(id)sender;

-(IBAction)help:(id)sender;
-(IBAction)goBack:(id)sender;

@property(nonatomic, retain) IBOutlet UIView *superMainView;

@property(nonatomic, retain) IBOutlet UIImageView *viewWallpaper;

-(IBAction)random:(id)sender;
//3d effect
@property(nonatomic, retain) IBOutlet UIImageView *cameraRollIcon;
@property(nonatomic, retain) IBOutlet UIImageView *deviceCameraIcon;
@property(nonatomic, retain) IBOutlet UIImageView *goBackIcon;
@property(nonatomic, retain) IBOutlet UIImageView *helpIcon;
@property(nonatomic, retain) IBOutlet UIImageView *randomIcon;

@property(nonatomic, retain) IBOutlet UIButton *cameraRollBtn;
@property(nonatomic, retain) IBOutlet UIButton *deviceCameraBtn;
@property(nonatomic, retain) IBOutlet UIButton *goBackBtn;
@property(nonatomic, retain) IBOutlet UIButton *helpBtn;
@property(nonatomic, retain) IBOutlet UIButton *randomBtn;

@property(nonatomic, retain) IBOutlet UIButton *startButton;
@end
