//
//  UploadiPadViewController.m
//  iLookLikeiOS7
//
//  Created by SpidrWeb on 9/1/13.
//  Copyright (c) 2013 BrainGears Software. All rights reserved.
//

#import "UploadiPadViewController.h"
#import "UIImage+ImageEffects.h"

@interface UploadiPadViewController ()
@property(nonatomic, retain) UIImage *image;
@end

@implementation UploadiPadViewController
@synthesize viewWallpaper;
@synthesize myImage, mainView, previewView, startView, superMainView;
@synthesize cameraRollBtn, cameraRollIcon, deviceCameraBtn, deviceCameraIcon, randomBtn, randomIcon, goBackBtn, goBackIcon, helpBtn, helpIcon, popoverController;

-(IBAction)random:(id)sender{
    UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"Proceed?" message:@"Tap START to start the slide show and catch your friends reaction.\n\nNote* Tapping START will load a page to have your friend tap START, so he/she is not aware of what's happening.\nA poster will automatically be saved to your Camera Roll without them knowing so you have even more fun!" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Start", nil];
    
    msg.alertViewStyle = UIAlertViewStylePlainTextInput;
    nameField = [msg textFieldAtIndex:0];
    nameField.keyboardAppearance = UIKeyboardAppearanceDark;
    nameField.placeholder =  @"Enter Victims Name (For The Poster)";
    
    [msg show];
    
    randomString = @"uploadedViewRandom";
}


- (void) useCameraRoll
{
 if ([self.popoverController isPopoverVisible]) {
        [self.popoverController dismissPopoverAnimated:YES];
        
    } else {
        if ([UIImagePickerController isSourceTypeAvailable:
             UIImagePickerControllerSourceTypeSavedPhotosAlbum])
        {
            UIImagePickerController *imagePicker =
            [[UIImagePickerController alloc] init];
            imagePicker.delegate = self;
            imagePicker.sourceType =
            UIImagePickerControllerSourceTypePhotoLibrary;
            imagePicker.mediaTypes = [NSArray arrayWithObjects:
                                      (NSString *) kUTTypeImage,
                                      nil];
            imagePicker.allowsEditing = NO;
            
            self.popoverController = [[UIPopoverController alloc]
                                      initWithContentViewController:imagePicker];
            
            CGRect rect=CGRectMake(0, 10, 280, 270);
            
            popoverController.delegate = self;
            
            [self.popoverController           presentPopoverFromRect:rect inView:mainView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
            
            
            // [self.popoverController presentPopoverFromBarButtonItem:nil permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
            
            
            newMedia = NO;
        }
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    
    NSString *mediaType = [info
                           objectForKey:UIImagePickerControllerMediaType];
   
    [self.popoverController dismissPopoverAnimated:true];
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *image = [info
                          objectForKey:UIImagePickerControllerOriginalImage];
        
        
        
        myImage.image = image;
        myImage.contentMode = UIViewContentModeScaleToFill;
        
        
        if (newMedia){
            //UIImageWriteToSavedPhotosAlbum(image,
            //                               self,
            //                               @selector(image:finishedSavingWithError:contextInfo:),
            //                               nil);
        }
    }
    else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])
    {
		// Code here to support video if enabled
	}
    
    
    mainView.frame = CGRectMake(0, 0, 768, 1024);
    previewView.frame = CGRectMake(1024, 0, 768, 1024);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    
    mainView.frame = CGRectMake(1024, 0, 768, 1024);
    previewView.frame = CGRectMake(0, 0, 768, 1024);
    
    [UIView commitAnimations];
    
}





-(void)image:(UIImage *)image
finishedSavingWithError:(NSError *)error
 contextInfo:(void *)contextInfo
{
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Save failed"
                              message: @"Failed to save image"
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
        
    }
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}




- (void) useCamera
{
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeCamera])
    {
        
        
        UIImagePickerController *imagePicker =
        [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType =
        UIImagePickerControllerSourceTypeCamera;
        imagePicker.mediaTypes = [NSArray arrayWithObjects:
                                  (NSString *) kUTTypeImage,
                                  nil];
        imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        
        imagePicker.allowsEditing = NO;
        [self presentViewController:imagePicker animated:YES completion:nil];
        
        newMedia = YES;
        
        
    }
    
}






-(IBAction)help:(id)sender{
    UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"Help" message:@"This app is equipped with alot of pictures to have fun with,\nHowever if you have your own image and would like to see your friends reaction, simply upload it here\nTap start and hand him/her the device, and let the magic happen." delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles: nil]; [msg show];
    
    
}
-(IBAction)goBack:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}




//after upload

-(IBAction)cancelUploadedImage:(id)sender{
    previewView.frame = CGRectMake(0, 0, 768, 1024);
    mainView.frame = CGRectMake(0, -1024, 768, 1024);
    
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    
    previewView.frame = CGRectMake(0, 1024, 768, 1024);
    mainView.frame = CGRectMake(0, 0, 768, 1024);
    
    [UIView commitAnimations];
}
-(IBAction)useUploadedImage:(id)sender{
    
    UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"Proceed?" message:@"Tap START to use this image and get your friends reaction to it.\n\nNote* Tapping START will load a page to have your friend tap START, so he/she is not aware of what's happening.\nA poster will automatically be saved to your Camera Roll without them knowing so you have even more fun!" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Start", nil];
    
    msg.alertViewStyle = UIAlertViewStylePlainTextInput;
    nameField = [msg textFieldAtIndex:0];
    nameField.keyboardAppearance = UIKeyboardAppearanceDark;
    nameField.placeholder = @"Enter Victims Name (For The Poster)";
    
    [msg show];
    
    randomString = @"uploadedView";
    
}
//alert view calls

-(IBAction)startShowFriend:(id)sender{
    if([randomString isEqualToString:@"uploadedView"]){
        iPadViewController *mvController = [[iPadViewController alloc] initWithNibName:@"iPadViewController" bundle:[NSBundle mainBundle]];
        
        mvController.img = myImage.image;
        [self.navigationController pushViewController:mvController animated:YES];
        
        mvController.uploadViewString = @"uploadedView";
        mvController.nameString = nameField.text;
        
        mvController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:mvController animated:YES completion:nil];
    }
    
    
    else    if([randomString isEqualToString:@"uploadedViewRandom"]){
        iPadViewController *mvController = [[iPadViewController alloc] initWithNibName:@"iPadViewController" bundle:[NSBundle mainBundle]];
        
        
        mvController.uploadViewString = @"uploadedViewRandom";
        mvController.nameString = nameField.text;
        
        mvController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:mvController animated:YES completion:nil];
    }
    
    
    
    
    
    resetViewtimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(resetView) userInfo:nil repeats:YES];
    
    
}
-(void)resetView{
    resetInt += 1;
    if(resetInt == 3){
        self.view = self.superMainView;
        [self cancelUploadedImage:nil];
        
        [shakeTimer invalidate];
        [resetViewtimer invalidate];
        resetInt = 0;
    }
}
- (void)earthquake:(UIView*)statView
{
    backgroundColorInt += 1;
    
    if(backgroundColorInt == 1){
        startView.backgroundColor = [UIColor blackColor];
    }
    else if(backgroundColorInt == 2){
        startView.backgroundColor = [UIColor redColor];
    }
    else if(backgroundColorInt == 3){
        startView.backgroundColor = [UIColor yellowColor];
    }
    else if(backgroundColorInt == 4){
        startView.backgroundColor = [UIColor purpleColor];
    }
    else if(backgroundColorInt == 5){
        startView.backgroundColor = [UIColor grayColor];
    }
    else if(backgroundColorInt == 6){
        startView.backgroundColor = [UIColor blueColor];
        backgroundColorInt = 0;
    }
    
    
    
    CGFloat t = 2.0;
    
    CGAffineTransform leftQuake  = CGAffineTransformTranslate(CGAffineTransformIdentity, t, -t);
    CGAffineTransform rightQuake = CGAffineTransformTranslate(CGAffineTransformIdentity, -t, t);
    
    startView.transform = leftQuake;  // starting point
    
    [UIView beginAnimations:@"earthquake" context:(__bridge void *)(startView)];
    [UIView setAnimationRepeatAutoreverses:YES]; // important
    [UIView setAnimationRepeatCount:5];
    [UIView setAnimationDuration:0.07];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(earthquakeEnded:finished:context:)];
    
    startView.transform = rightQuake; // end here & auto-reverse
    
    [UIView commitAnimations];
}



- (void)earthquakeEnded:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    if ([finished boolValue])
    {
    	UIView* item = (__bridge UIView *)context;
    	item.transform = CGAffineTransformIdentity;
    }
}
-(void) alertView :(UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    NSString *select = [alertView buttonTitleAtIndex: buttonIndex];
    
    if([select isEqualToString:@"Start"]){
        self.view = self.startView;
        
        //  [self earthquake:startView];
        
        shakeTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(earthquake:) userInfo:nil repeats:YES];
        
        
    }
}



//////////////////******************/////////////********** LOAD VIEW AND RELEASE MEMORY
- (void)viewDidLoad
{
    backgroundColorInt = 0;
    resetInt = 0;
    
    self.image = viewWallpaper.image;
    UIImage *effectImage = nil;
    effectImage = [self.image applyLightEffect];
    self.viewWallpaper.image = effectImage;
    
    viewWallpaper.alpha = 0.8;
    
    
    
    UIInterpolatingMotionEffect *xAxis = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    xAxis.minimumRelativeValue = [NSNumber numberWithFloat:-15.0];
    xAxis.maximumRelativeValue = [NSNumber numberWithFloat:+15.0];
    
    UIInterpolatingMotionEffect *yAxis = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    yAxis.minimumRelativeValue = [NSNumber numberWithFloat:-15.0];
    yAxis.maximumRelativeValue = [NSNumber numberWithFloat:+15.0];
    
    
    UIMotionEffectGroup *group = [[UIMotionEffectGroup alloc] init];
    group.motionEffects = @[xAxis, yAxis];
    [cameraRollIcon addMotionEffect:group];
    [cameraRollBtn addMotionEffect:group];
    [deviceCameraIcon addMotionEffect:group];
    [deviceCameraBtn addMotionEffect:group];
    [randomIcon addMotionEffect:group];
    [randomBtn addMotionEffect:group];
    [goBackIcon addMotionEffect:group];
    [goBackBtn addMotionEffect:group];
    [helpIcon addMotionEffect:group];
    [helpBtn addMotionEffect:group];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)dealloc{
    self.image = nil;
    self.startView = nil;
    self.mainView = nil;
    self.myImage = nil;
    self.previewView = nil;
    self.superMainView = nil;
    self.viewWallpaper = nil;
    self.cameraRollBtn = nil;
    self.cameraRollIcon = nil;
    self.deviceCameraBtn = nil;
    self.deviceCameraIcon = nil;
    self.goBackBtn = nil;
    self.goBackIcon = nil;
    self.helpBtn = nil;
    self.helpIcon = nil;
    self.randomBtn = nil;
    self.randomIcon = nil;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)prefersStatusBarHidden
{
    return YES;
}
@end
