//
//  UploadiPhoneViewController.m
//  iLookLikeiOS7
//
//  Created by SpidrWeb on 9/1/13.
//  Copyright (c) 2013 BrainGears Software. All rights reserved.
//

#import "UploadiPhoneViewController.h"
#import "UIImage+ImageEffects.h"

@interface UploadiPhoneViewController ()
@property(nonatomic, retain) UIImage *image;

@end

@implementation UploadiPhoneViewController
@synthesize viewWallpaper;
@synthesize myImage, mainView, previewView, startView, superMainView;
@synthesize cameraRollBtn, cameraRollIcon, deviceCameraBtn, deviceCameraIcon, randomBtn, randomIcon, goBackBtn, goBackIcon, helpBtn, helpIcon, startButton;

-(IBAction)random:(id)sender{
         UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"Proceed?" message:@"Tapping START will load a page to have your friend tap START, so they are not aware of what's happening." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Start", nil];
    
    msg.alertViewStyle = UIAlertViewStylePlainTextInput;
    nameField = [msg textFieldAtIndex:0];
    nameField.keyboardAppearance = UIKeyboardAppearanceDark;
    nameField.placeholder =  @"Enter Victims Name (For The Poster)";
    
    [msg show];
    
    randomString = @"uploadedViewRandom";
}
- (void) useCameraRoll
{
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
        [self presentViewController:imagePicker animated:YES completion:nil];
        
        newMedia = NO;
        
        
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    
    NSString *mediaType = [info
                           objectForKey:UIImagePickerControllerMediaType];
    [self dismissViewControllerAnimated:YES completion:nil];
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
    
    
    ///IPHONE SIZE SETTINGS
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
            CGSize result = [[UIScreen mainScreen] bounds].size;
            CGFloat scale = [UIScreen mainScreen].scale;
            result = CGSizeMake(result.width * scale, result.height * scale);
            
            if(result.height == 960 || result.height == 480) {//480 iPad mini 1
                NSLog(@"iPhone 4 Resolution");
                
                
                
                mainView.frame = CGRectMake(1000, 0, 320, 480);
                previewView.frame = CGRectMake(0, 0, 320, 480);
                
                
            }
            if(result.height == 1136) {
                NSLog(@"iPhone 5 Resolution");
                
                
                
                mainView.frame = CGRectMake(1000, 0, 320, 568);
                previewView.frame = CGRectMake(0, 0, 320, 568);
                
            }
        }
        
    }
    ///IPHONE SIZE SETTINGS
    
    
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
    
    ///IPHONE SIZE SETTINGS
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
            CGSize result = [[UIScreen mainScreen] bounds].size;
            CGFloat scale = [UIScreen mainScreen].scale;
            result = CGSizeMake(result.width * scale, result.height * scale);
            
            if(result.height == 960 || result.height == 480) {//480 iPad mini 1
                NSLog(@"iPhone 4 Resolution");
                
                
                previewView.frame = CGRectMake(0, 0, 320, 480);
                mainView.frame = CGRectMake(0, -480, 320, 480);
                
                
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:0.5];
                
                previewView.frame = CGRectMake(0, 480, 320, 480);
                mainView.frame = CGRectMake(0, 0, 320, 480);
                
                [UIView commitAnimations];
                
                
            }
            if(result.height == 1136) {
                NSLog(@"iPhone 5 Resolution");
                
                
                previewView.frame = CGRectMake(0, 0, 320, 568);
                mainView.frame = CGRectMake(0, -568, 320, 568);
                
                
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:0.5];
                
                previewView.frame = CGRectMake(0, 568, 320, 568);
                mainView.frame = CGRectMake(0, 0, 320, 568);
                
                [UIView commitAnimations];
                
            }
        }
        
    }
    ///IPHONE SIZE SETTINGS

}
-(IBAction)useUploadedImage:(id)sender{
    
    UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"Proceed?" message:@"Tapping START will load a page to have your friend tap START, so they are not aware of what's happening." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Start", nil];
    
    
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
        iPhoneViewController *mvController = [[iPhoneViewController alloc] initWithNibName:@"iPhoneViewController" bundle:[NSBundle mainBundle]];
        
        mvController.img = myImage.image;
        [self.navigationController pushViewController:mvController animated:YES];
        
        mvController.uploadViewString = randomString;
        mvController.nameString = nameField.text;
        
        mvController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:mvController animated:YES completion:nil];
    }
    
    
    else    if([randomString isEqualToString:@"uploadedViewRandom"]){
        iPhoneViewController *mvController = [[iPhoneViewController alloc] initWithNibName:@"iPhoneViewController" bundle:[NSBundle mainBundle]];
        
        
        mvController.uploadViewString = randomString;
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



//////////////***********//////////***********  LOAD VIEW & RELEASE MEMORY
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
    
    
    
    
    ///IPHONE SIZE SETTINGS
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
            CGSize result = [[UIScreen mainScreen] bounds].size;
            CGFloat scale = [UIScreen mainScreen].scale;
            result = CGSizeMake(result.width * scale, result.height * scale);
            
            if(result.height == 960 || result.height == 480) {//480 iPad mini 1
                NSLog(@"iPhone 4 Resolution");
                
               // previewView.frame = CGRectMake(0, 0, 320, 480);
                //myImage.frame = CGRectMake(0, 44, 320, 436);
                
                startView.frame = CGRectMake(0, 0, 320, 480);
                startButton.frame = CGRectMake(0, 0, 320, 480);
                
                
            }
            if(result.height == 1136) {
                NSLog(@"iPhone 5 Resolution");
                
                
            }
        }
        
    }
    ///IPHONE SIZE SETTINGS
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
