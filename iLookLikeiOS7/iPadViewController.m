//
//  iPadViewController.m
//  iLookLikeiOS7
//
//  Created by SpidrWeb on 8/30/13.
//  Copyright (c) 2013 BrainGears Software. All rights reserved.
//

#import "iPadViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface iPadViewController ()
@property (nonatomic) UIImage *image;
@end

@implementation iPadViewController

//count down > show image > take image > reaction screen
@synthesize countDownView, mainImage, userPicture, secondMainImage, userReactionShareView, countDownReactionView;

//share options
@synthesize shareBothimagesSwitch, yourReactionScreenShotLabel, developerScreenShotLabel, mainImageScreenShotLabel;

//printscreen > the screen which gets printed to share the image
@synthesize printScreenView, userReactionPrintScreenImage, mainImagePrintScreenImage, userReactionSoloPrintScreenImageView;


//import uploaded image
@synthesize img, uploadViewString, backButton, showMoreButton, nameString, showMoreIcon;

//other
@synthesize pleaseHoldWallpaper;

////MAIN CODE
//share reaction
-(IBAction)emailReaction:(id)sender{
    self.view = self.printScreenView;
    
    MFMailComposeViewController *mailComposer;
    mailComposer  = [[MFMailComposeViewController alloc] init];
    mailComposer.mailComposeDelegate = self;
    [mailComposer setModalPresentationStyle:UIModalPresentationFormSheet];
    [mailComposer setSubject:@"Wanna laugh?"];
    NSString *emailBody = [NSString alloc];
    
    
    if([nameString length] != 0){
        emailBody =
        [NSString stringWithFormat:@"This was the expression to a picture %@ just saw, funny right? Download iLookLike from the App Store and see your expression. https://itunes.apple.com/us/app/ilooklikeios7/id701121215?mt=8", nameString];
    }
    else{
    emailBody =
        [NSString stringWithFormat:@"This was the expression to a picture I just saw, funny right? Download iLookLike from the App Store and see your expression. https://itunes.apple.com/us/app/ilooklikeios7/id701121215?mt=8"];
    }
    
    
    [mailComposer setMessageBody:emailBody isHTML:YES];
    
    
    
    /////////print screen add image
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *imagePrint = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *imagePrintData = UIImageJPEGRepresentation(imagePrint, 1.0);
    
    [mailComposer addAttachmentData:imagePrintData mimeType:@"image/jpeg" fileName:@"attachment.jpg"];
    
    
    /////////print screen add image
    
    
    mailComposer.navigationBar.tintColor = [UIColor grayColor];
    [self presentViewController:mailComposer animated:YES completion:nil];
    
    
    
    
    
    
    
    self.view = self.countDownReactionView;
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    
    self.view = self.view;
    [self dismissViewControllerAnimated:YES completion:nil];
    //dismisses email composer
}

-(IBAction)fbReaction:(id)sender{
    self.view = self.printScreenView;
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *imagePrint = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view = self.countDownReactionView;
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        
        slComposeViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        
        
        
        if([nameString length] != 0){
        [slComposeViewController setInitialText:[NSString stringWithFormat:@"This was the expression to a picture %@ just saw, funny right? Download iLookLike from the App Store and see your expression. https://itunes.apple.com/us/app/ilooklikeios7/id701121215?mt=8", nameString]];
        }
        else {
            [slComposeViewController setInitialText:[NSString stringWithFormat:@"This was the expression to a picture I just saw, funny right? Download iLookLike from the App Store and see your expression. https://itunes.apple.com/us/app/ilooklikeios7/id701121215?mt=8"]];
        }
        
        
        
        
        
        
        [slComposeViewController addImage:imagePrint];
        
        [self presentViewController:slComposeViewController animated:YES completion:nil];
    }
    
    else {
        UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"No Facebook Account" message:@"No Facebook account was detected. On your device, from your HOME SCREEN please goto SETTINGS > FACEBOOK to add or create an account" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [msg show];
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs://root=FACEBOOK"]];
    }
    
    
    
    [slComposeViewController setCompletionHandler:^(SLComposeViewControllerResult result) {
        NSString *output = @"";
        switch (result) {
            case SLComposeViewControllerResultCancelled:
                output = @"Action Cancelled";
                break;
            case SLComposeViewControllerResultDone:
                output = @"Post Successfull";
                break;
            default:
                break;
        }
        
        
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Facebook Message" message:output delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        
        [alert show];
    }];
    
    
    
    
    self.view = self.countDownReactionView;
    
    
}

-(IBAction)clipboardReaction:(id)sender{
    
    self.view = self.printScreenView;
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *imagePrint = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [[UIPasteboard generalPasteboard] setImages:[NSArray arrayWithObjects:imagePrint, nil]];
    
    
    self.view = self.countDownReactionView;
}
-(IBAction)cameraRollReaction:(id)sender{
    
    self.view = self.printScreenView;
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *imagePrint = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(imagePrint, nil, nil, nil);
    
    
    
    self.view = self.countDownReactionView;
    
    if([uploadViewString length] == 0){
    UIAlertView *msg = [[ UIAlertView alloc] initWithTitle:@"Image Saved" message:@"Your Image was successfully saved to Camera Roll" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] ;
    [msg show];
    }
}



//after sharing or sharing skip
-(IBAction)showMoreImages:(id)sender{
    [self viewDidLoad];
}

//go back to main menu
-(IBAction)mainMenu:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//share both images
-(IBAction)infoBtnShareBothImages:(id)sender{
    UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"WARNING" message:@"Sharing is always fun, however in same cases it might be inapropriate to certain people especially for young children.\n\nIf you would like to share your facial reaction only, simply turn this switch off before selecting a share option" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];[msg show];
}
-(IBAction)shareBothImagesSend:(id)sender{
    if(shareBothimagesSwitch.on == NO){
        //0,0,768,1024 - 0,0,384,512
        
        userReactionSoloPrintScreenImageView.hidden = NO;
        
        userReactionPrintScreenImage.hidden = YES;
        mainImagePrintScreenImage.hidden = YES;
        mainImageScreenShotLabel.hidden = YES;
        yourReactionScreenShotLabel.frame = CGRectMake(10, 0, 700, 80);
        
        if([nameString length] != 0){
        yourReactionScreenShotLabel.text = [NSString stringWithFormat:@"This was the expression to a picture %@ just saw! Funny Right?!!", nameString];
        }
        else {
            yourReactionScreenShotLabel.text = @"This was my reaction to a picture I just saw! Funny Right?!!";
        }
        
        secondMainImage.alpha = 1;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        secondMainImage.alpha = 0;
        [UIView commitAnimations];
        
        
        userPicture.frame = CGRectMake(0, 0, 384, 512);
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.4];
        [UIView setAnimationDelay:0.5];
        userPicture.frame = CGRectMake(192, 0, 384, 512);
        [UIView commitAnimations];
    }
    else if(shareBothimagesSwitch.on == YES){
        mainImagePrintScreenImage.hidden = NO;
        
        mainImageScreenShotLabel.hidden = NO;
        userReactionPrintScreenImage.hidden = NO;
        userReactionSoloPrintScreenImageView.hidden = YES;
        yourReactionScreenShotLabel.frame = CGRectMake(386, 130, 382, 84);
        
        if([nameString length] != 0){
            yourReactionScreenShotLabel.text =[NSString stringWithFormat:@"< %@'s Expression", nameString];
        }
        else {
        yourReactionScreenShotLabel.text = @"< My Expression";
        }
        
        userPicture.frame = CGRectMake(192, 0, 384, 512);
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.4];
        userPicture.frame = CGRectMake(0, 0, 384, 512);
        [UIView commitAnimations];
        
        secondMainImage.alpha = 0;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationDelay:0.5];
        secondMainImage.alpha = 1;
        [UIView commitAnimations];
        
        
    }
  
}




-(void)countDown{
    
    
    countDownInt -= 1;
    
    if(countDownInt == 1){
        flipImageDouble = -0.00;
        flipImageTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(flipImageCount) userInfo:nil repeats:YES];
        
        
    }
    
    if(countDownInt == 0){
        
        
        
        countDownView.alpha = 1;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1.0];
        countDownView.alpha = 0;
        [UIView commitAnimations];
        
        mainImage.alpha = 0;
        mainImage.hidden = NO;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1.0];
        [UIView setAnimationDelay:0.2];
        mainImage.alpha = 1;
        [UIView commitAnimations];
        
        [countDownTimer invalidate];
    }
    
    
}
///get randdom number
-(int) getRandomNumberBetweenMin:(int)min andMax:(int)max//sets random number min and max numbers
{
	return ( (arc4random() % (max-min+1)) + min );
}



-(void)flipImageCount{
    flipImageDouble += 0.5;
    
    tempDouble = randomAmountCute - flipImageDouble;
    

    
    
    if(tempDouble >= 2.0){
        if(tempDouble == 2){
            shootTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(shootPic) userInfo:nil repeats:YES];
        }
    
        
        //selecting the images
        randomCute = [self getRandomNumberBetweenMin:1 andMax:89];
        
        
        if ([chosen_numbers indexOfObject:[NSNumber numberWithInt:randomCute]]!=NSNotFound){
            randomCute = [self getRandomNumberBetweenMin:1 andMax:89];
            
        }
        else{
            NSString *imageSelString = [NSString stringWithFormat:@"c%i.jpg", randomCute];
            
            
            [mainImage setImage:[UIImage imageNamed:imageSelString]];
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.5];
            [UIView setAnimationTransition :UIViewAnimationTransitionFlipFromRight forView:mainImage cache:NO];
            [UIView commitAnimations];
            
            
            sleep(1);
            
            [chosen_numbers addObject:[NSNumber numberWithInt:randomCute]];
            
        }
        
    
        
        mainImage.contentMode = UIViewContentModeScaleAspectFit;
        
    }
    
   
    
    if( tempDouble == 1.0){
        
        if([uploadViewString isEqualToString:@"uploadedView"]){
            [mainImage setImage:img];
            [secondMainImage setImage:img];
            [mainImagePrintScreenImage setImage:img];
            
            
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.5];
            [UIView setAnimationTransition :UIViewAnimationTransitionFlipFromRight forView:mainImage cache:NO];
            [UIView commitAnimations];
            
        }
        
        else {
            
            //selecting the images
            randomDiscusting = [self getRandomNumberBetweenMin:1 andMax:90];
            
            NSString *imageSelString = [NSString stringWithFormat:@"%i.jpg", randomDiscusting];
            [mainImage setImage:[UIImage imageNamed:imageSelString]];
            [secondMainImage setImage:[UIImage imageNamed:imageSelString]];
            [mainImagePrintScreenImage setImage:[UIImage imageNamed:imageSelString]];
            
            
            
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.5];
            [UIView setAnimationTransition :UIViewAnimationTransitionFlipFromRight forView:mainImage cache:NO];
            [UIView commitAnimations];
            
            
        }
        mainImage.contentMode = UIViewContentModeScaleAspectFit;
        userReactionPrintScreenImage.contentMode = UIViewContentModeScaleAspectFit;
        mainImagePrintScreenImage.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    
    if( tempDouble == 0.00){
       
        
        mainImage.hidden = YES;
        userReactionShareView.hidden = NO;
   
        
        
        userPicture.frame = CGRectMake(0, 0, 764, 1024);
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        userPicture.frame = CGRectMake(0, 0, 382, 512);
        secondMainImage.frame = CGRectMake(384, 0, 384, 512);
        [UIView commitAnimations];
        
       
        userReactionPrintScreenImage.contentMode = UIViewContentModeScaleAspectFit;
        mainImagePrintScreenImage.contentMode = UIViewContentModeScaleAspectFit;
        
        [flipImageTimer invalidate];
        
        if([uploadViewString length] != 0){
            [self cameraRollReaction:nil];
        }
       
    }
   
    NSLog(@"%f", tempDouble);
}
- (void)viewDidLoad
{
    
    
    
    self.image = pleaseHoldWallpaper.image;
    UIImage *effectImage = nil;
    effectImage = [self.image applyLightEffect];
    self.pleaseHoldWallpaper.image = effectImage;
    
    
    
    if([uploadViewString isEqualToString:@"uploadedView"] || [uploadViewString isEqualToString:@"uploadedViewRandom"] ){
        showMoreButton.hidden = YES;
        showMoreIcon.hidden = YES;
        
    }
    else {
        showMoreButton.hidden = NO;
        showMoreIcon.hidden = NO;
    }
    
    if([nameString length] != 0){
        yourReactionScreenShotLabel.text =[NSString stringWithFormat:@"< %@'s Expression", nameString];
    }
    else {
        yourReactionScreenShotLabel.text = @"< My Expression";
    }
    
    mainImage.contentMode = UIViewContentModeScaleAspectFit;
    userReactionPrintScreenImage.contentMode = UIViewContentModeScaleAspectFit;
    mainImagePrintScreenImage.contentMode = UIViewContentModeScaleAspectFit;
   
    shootFloat = 0.00;
    
    chosen_numbers = [[NSMutableArray alloc] initWithObjects: nil];
    //selecting the amount of random images to show before the camera takes shot on the discusting one
    randomAmountCute = [self getRandomNumberBetweenMin:3 andMax:7];
    
    //selecting the images
    randomCute = [self getRandomNumberBetweenMin:1 andMax:89];
    
    NSString *imageSelString = [NSString stringWithFormat:@"c%i.jpg", randomCute];
    
    
    [mainImage setImage:[UIImage imageNamed:imageSelString]];
    
    
    ////
    userReactionShareView.hidden = YES;
    
    countDownView.hidden = NO;
    countDownInt = 2;
    
    
    
    mainImage.hidden = YES;
    
    
    
    countDownTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    
    userReactionPrintScreenImage.transform = CGAffineTransformMakeRotation(M_PI * +0.1);
    mainImagePrintScreenImage.transform = CGAffineTransformMakeRotation(M_PI * -0.1);
    userReactionSoloPrintScreenImageView.transform = CGAffineTransformMakeRotation(M_PI * +0.1);
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)shootPic{
    shootFloat += 0.1;
    
    if(shootFloat >= 0.9){
        
        [self tempCamCode];
        shootFloat = 0.00;
        [shootTimer invalidate];
    }
    
}

-(void)tempCamCode{
   
    
    
    
    // Get all cameras in the application and find the frontal camera.
    AVCaptureDevice *frontalCamera;
    NSArray *allCameras = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    
    // Find the frontal camera.
    for ( int i = 0; i < allCameras.count; i++ ) {
        AVCaptureDevice *camera = [allCameras objectAtIndex:i];
        
        if ( camera.position == AVCaptureDevicePositionFront ) {
            frontalCamera = camera;
        }
    }
    
    // If we did not find the camera then do not take picture.
    if ( frontalCamera != nil ) {
        // Start the process of getting a picture.
        session = [[AVCaptureSession alloc] init];
        
        // Setup instance of input with frontal camera and add to session.
        NSError *error;
        AVCaptureDeviceInput *input =
        [AVCaptureDeviceInput deviceInputWithDevice:frontalCamera error:&error];
        
        if ( !error && [session canAddInput:input] ) {
            // Add frontal camera to this session.
            [session addInput:input];
            
            // We need to capture still image.
            AVCaptureStillImageOutput *output = [[AVCaptureStillImageOutput alloc] init];
            
            // Captured image. settings.
            [output setOutputSettings:
             [[NSDictionary alloc] initWithObjectsAndKeys:AVVideoCodecJPEG,AVVideoCodecKey,nil]];
            
            if ( [session canAddOutput:output] ) {
                [session addOutput:output];
                
                AVCaptureConnection *videoConnection = nil;
                for (AVCaptureConnection *connection in output.connections) {
                    for (AVCaptureInputPort *port in [connection inputPorts]) {
                        if ([[port mediaType] isEqual:AVMediaTypeVideo] ) {
                            videoConnection = connection;
                            break;
                        }
                    }
                    if (videoConnection) { break; }
                }
                
                
                // Finally take the picture
                if ( videoConnection ) {
                    [session startRunning];
                    
                //////
                    
                    sleep(1);
                    
                  //////
                        
                        [output captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
                            
                            if (imageDataSampleBuffer != NULL) {
                                NSData *imageData = [AVCaptureStillImageOutput
                                                     jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
                                UIImage *photo = [[UIImage alloc] initWithData:imageData];
                                
                                userPicture.image = photo;
                                userReactionPrintScreenImage.image = photo;
                                userReactionSoloPrintScreenImageView.image = photo;
                                
                                
                                
                            }
                            
                        }];
                        
                    
                   
                }
            }
        }
    }
    
    
    
    
}








//////////////////////////////////////
-(void)dealloc{
    self.countDownReactionView = nil;
    self.countDownView = nil;
    self.mainImage = nil;
    self.userReactionShareView = nil;
    self.userPicture = nil;
    self.secondMainImage = nil;
    self.shareBothimagesSwitch = nil;
    self.yourReactionScreenShotLabel = nil;
    self.mainImageScreenShotLabel = nil;
    self.developerScreenShotLabel = nil;
    self.printScreenView = nil;
    self.userReactionPrintScreenImage = nil;
    self.mainImagePrintScreenImage = nil;
    self.userReactionSoloPrintScreenImageView = nil;
    self.img = nil;
    self.uploadViewString = nil;
    self.nameString = nil;
    self.backButton = nil;
    self.showMoreButton = nil;
    self.showMoreIcon = nil;
    self.pleaseHoldWallpaper = nil;
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (BOOL)prefersStatusBarHidden
{
    return YES;
}
@end


