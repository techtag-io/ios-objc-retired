//
//  iPhoneViewController.m
//  iLookLikeiOS7
//
//  Created by SpidrWeb on 8/15/13.
//  Copyright (c) 2013 BrainGears Software. All rights reserved.
//

#import "iPhoneViewController.h"
#import "UIImage+ImageEffects.h"

@interface iPhoneViewController ()
@property (nonatomic) UIImage *image;
@end

@implementation iPhoneViewController

//delete this synt
//@synthesize picZoomInBtn, goBackButton, mailBtn, fbBtn, cameraRollBtn;

@synthesize  countDownView, mainImage, userPicture, secondMainImage, userReactionShareView, countDownReactionView, pleaseHoldWallpaper;

//zooming in user picture
@synthesize userPicScrollView, zoomInImageBtn, shareBothimagesSwitch;

//printscreen > the screen which gets printed to share the image
@synthesize printScreenView, userReactionPrintScreenImage, mainImagePrintScreenImage, mainImageScreenShotLabel, developerScreenShotLabel, yourReactionScreenShotLabel, userReactionSoloPrintScreenImageView;

//buttons
@synthesize   iPhoneView, showMoreButton;
@synthesize viewWallpaper, uploadViewString, img, moreIcon, nameString;
@synthesize pleaseHoldLabel, iconMainWallpaper, iconPrintScreenWallpaper, buttonsView;

//Main Code//

//Button Actions Start
//share reaction
//email
-(IBAction)emailReaction:(id)sender{
    //changing view to take the screenshot
    self.view = self.printScreenView;
    
    //loading email composer
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
    
    [mailComposer setMessageBody:emailBody isHTML:NO];
    
    
    
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
    
    
    
    
    
    
    
    self.view = self.iPhoneView;
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    
    self.view = self.view;
    [self dismissViewControllerAnimated:YES completion:nil];
    //dismisses email composer
}

//facebook
-(IBAction)fbReaction:(id)sender{
    self.view = self.printScreenView;
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *imagePrint = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view = self.iPhoneView;
    
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
        UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"No Facebook Account" message:@"No Facebook account was detected. On your device please goto SETTINGS > FACEBOOK to add or create an account" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
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
    
    
    
    
   // self.view = self.iPhoneView;
    
    
}

//Copy to clipboard
-(IBAction)clipboardReaction:(id)sender{
    
    self.view = self.printScreenView;
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *imagePrint = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [[UIPasteboard generalPasteboard] setImages:[NSArray arrayWithObjects:imagePrint, nil]];
    
    
    self.view = self.iPhoneView;
    
    UIAlertView *msg = [[ UIAlertView alloc] initWithTitle:@"Image Copied" message:@"Your Image was successfully copied to clipboard\n\nYou may now paste it anywhere image pasting is allowed" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] ;
    [msg show];
}

//Save To Camera Roll
-(IBAction)cameraRollReaction:(id)sender{
    
    self.view = self.printScreenView;
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *imagePrint = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(imagePrint, nil, nil, nil);
    
    
    
    self.view = self.iPhoneView;
    
    if([uploadViewString length] == 0){
    UIAlertView *msg = [[ UIAlertView alloc] initWithTitle:@"Image Saved" message:@"Your Image was successfully saved to Camera Roll" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] ;
    [msg show];
    }
}
//share both images
-(IBAction)infoBtnShareBothImages:(id)sender{
    UIAlertView *msg = [[UIAlertView alloc] initWithTitle:@"WARNING" message:@"Sharing is always fun, however in same cases it might be inapropriate to certain people especially for young children.\n\nIf you would like to share your facial reaction only, simply turn this switch off before selecting a share option" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];[msg show];
}
-(IBAction)shareBothImagesSend:(id)sender{
   
    
    if(shareBothimagesSwitch.on == NO){

        userReactionSoloPrintScreenImageView.transform = CGAffineTransformMakeRotation(M_PI * +0.1);
        userReactionSoloPrintScreenImageView.hidden = NO;
        userReactionPrintScreenImage.hidden = YES;
        
        mainImagePrintScreenImage.hidden = YES;
        mainImageScreenShotLabel.hidden = YES;
        yourReactionScreenShotLabel.frame = CGRectMake(10, 0, 300, 50);
        
     
        
     
        
        if([nameString length] != 0){
            yourReactionScreenShotLabel.text = [NSString stringWithFormat:@"This was the reaction to a picture %@ just saw! Funny Right?!!", nameString];
            
            
        }
        else {
        yourReactionScreenShotLabel.text = @"This was my reaction to a picture I just saw! Funny Right?!!";
            
    
        }
     
        
        
        
       
        
        secondMainImage.alpha = 1;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        secondMainImage.alpha = 0;
        [UIView commitAnimations];
        
        
        /////////iPhone Detection settings
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
            if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
                CGSize result = [[UIScreen mainScreen] bounds].size;
                CGFloat scale = [UIScreen mainScreen].scale;
                result = CGSizeMake(result.width * scale, result.height * scale);
                
                if(result.height == 960 || result.height == 480) {//480 iPad mini 1
                    //NSLog(@"iPhone 4 Resolution");
                     zoomInImageBtn.frame = CGRectMake(80, 0, 160, 240);
                    
                    userPicScrollView.frame = CGRectMake(0, 0, 160, 240);
                    [UIView beginAnimations:nil context:NULL];
                    [UIView setAnimationDuration:0.4];
                    [UIView setAnimationDelay:0.5];
                    userPicScrollView.frame = CGRectMake(80, 0, 160, 240);
                    [UIView commitAnimations];
                    
                    
                }
                if(result.height == 1136) {
                    //NSLog(@"iPhone 5 Resolution");
                     zoomInImageBtn.frame = CGRectMake(80, 0, 160, 284);
                    
                    userPicScrollView.frame = CGRectMake(0, 0, 160, 284);
                    [UIView beginAnimations:nil context:NULL];
                    [UIView setAnimationDuration:0.4];
                    [UIView setAnimationDelay:0.5];
                    userPicScrollView.frame = CGRectMake(80, 0, 160, 284);
                    [UIView commitAnimations];
                }
            }
        }
        /////////iPhone Detection settings
        
        
        
    }
    else if(shareBothimagesSwitch.on == YES){
        mainImagePrintScreenImage.hidden = NO;
        mainImageScreenShotLabel.hidden = NO;
        
        yourReactionScreenShotLabel.frame = CGRectMake(169, 117, 148, 43);
        
        if([nameString length] != 0){
            yourReactionScreenShotLabel.text = [NSString stringWithFormat:@"< %@'s Reaction", nameString];
        }
        else {
            yourReactionScreenShotLabel.text = @"< My Expression";
        }
       
        
        userReactionSoloPrintScreenImageView.hidden = YES;
        userReactionPrintScreenImage.hidden = NO;
       
        
        /////////iPhone Detection settings
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
            if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
                CGSize result = [[UIScreen mainScreen] bounds].size;
                CGFloat scale = [UIScreen mainScreen].scale;
                result = CGSizeMake(result.width * scale, result.height * scale);
                
                if(result.height == 960 || result.height == 480) {//480 iPad mini 1
                    //NSLog(@"iPhone 4 Resolution");
                    
                    zoomInImageBtn.frame = CGRectMake(0, 0, 160, 240);
                    
                    userPicScrollView.frame = CGRectMake(80, 0, 160, 240);
                    [UIView beginAnimations:nil context:NULL];
                    [UIView setAnimationDuration:0.4];
                    userPicScrollView.frame = CGRectMake(0, 0, 160, 240);
                    [UIView commitAnimations];
                 
                    
                }
                if(result.height == 1136) {
                    //NSLog(@"iPhone 5 Resolution");
                    
                    zoomInImageBtn.frame = CGRectMake(0, 0, 160, 284);
                    
                    userPicScrollView.frame = CGRectMake(80, 0, 160, 284);
                    [UIView beginAnimations:nil context:NULL];
                    [UIView setAnimationDuration:0.4];
                    userPicScrollView.frame = CGRectMake(0, 0, 160, 284);
                    [UIView commitAnimations];
                }
            }
        }
        /////////iPhone Detection settings
        
        
        
        
   
        
        secondMainImage.alpha = 0;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationDelay:0.5];
        secondMainImage.alpha = 1;
        [UIView commitAnimations];
        
        
    }
}


//Return To Main Menu
-(IBAction)mainMenu:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
 uploadViewString = @"";
nameString = @"";
}

//Reload View To Start Over
-(IBAction)goAgain:(id)sender{
    [self viewDidLoad];
}

//Button Actions End



//User Reaction Image Selected To Zoom In
-(IBAction)userPictureZoomIn:(id)sender{
    
    /////////iPhone Detection settings
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
            CGSize result = [[UIScreen mainScreen] bounds].size;
            CGFloat scale = [UIScreen mainScreen].scale;
            result = CGSizeMake(result.width * scale, result.height * scale);
            
            if(result.height == 960 || result.height == 480) {//480 iPad mini 1
                //NSLog(@"iPhone 4 Resolution");
                
                userPicScrollView.frame = CGRectMake(userPicScrollView.frame.origin.x, userPicScrollView.frame.origin.y, 160, 240);
                userPicture.frame = CGRectMake(userPicture.frame.origin.x, userPicture.frame.origin.y, 160, 240);
                [UIView beginAnimations:Nil context:NULL];
                [UIView setAnimationDuration:0.5];
                userPicScrollView.frame = CGRectMake(0, 0, 320, 480);
                userPicture.frame = CGRectMake(0, 0, 320, 480);
                [UIView commitAnimations];
                
            }
            if(result.height == 1136) {
                //NSLog(@"iPhone 5 Resolution");
                
                userPicScrollView.frame = CGRectMake(userPicScrollView.frame.origin.x, userPicScrollView.frame.origin.y, 160, 284);
                userPicture.frame = CGRectMake(userPicture.frame.origin.x, userPicture.frame.origin.y, 160, 284);
                [UIView beginAnimations:Nil context:NULL];
                [UIView setAnimationDuration:0.5];
                userPicScrollView.frame = CGRectMake(0, 0, 320, 568);
                userPicture.frame = CGRectMake(0, 0, 320, 568);
                [UIView commitAnimations];
            }
        }
    }
    /////////iPhone Detection settings
    
    
    
    
    
    zoomInImageBtn.hidden = YES;

   
    
}
-(void)fingerTouchZoomOut{
    if(zoomInImageBtn.hidden == YES){
       
        
        if(shareBothimagesSwitch.on == YES){
            
            
            /////////iPhone Detection settings
            if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
                if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
                    CGSize result = [[UIScreen mainScreen] bounds].size;
                    CGFloat scale = [UIScreen mainScreen].scale;
                    result = CGSizeMake(result.width * scale, result.height * scale);
                    
                    if(result.height == 960 || result.height == 480) {//480 iPad mini 1
                        //NSLog(@"iPhone 4 Resolution");
                        
                        //userPicture.frame = CGRectMake(0, 0, 320, 568);
                        userPicScrollView.frame = CGRectMake(0, 0, 320, 480);
                        [UIView beginAnimations:Nil context:NULL];
                        [UIView setAnimationDuration:0.5];
                        // userPicture.frame = CGRectMake(0, 0, 160, 284);
                        userPicScrollView.frame = CGRectMake(0, 0, 160, 240);
                        
                        [UIView commitAnimations];
                        
                    }
                    if(result.height == 1136) {
                        //NSLog(@"iPhone 5 Resolution");
                        
                        //userPicture.frame = CGRectMake(0, 0, 320, 568);
                        userPicScrollView.frame = CGRectMake(0, 0, 320, 568);
                        [UIView beginAnimations:Nil context:NULL];
                        [UIView setAnimationDuration:0.5];
                        // userPicture.frame = CGRectMake(0, 0, 160, 284);
                        userPicScrollView.frame = CGRectMake(0, 0, 160, 284);
                        
                        [UIView commitAnimations];
                    }
                }
            }
            /////////iPhone Detection settings
            
            
            
            userPicture.contentMode = UIViewContentModeScaleToFill;
            [userPicScrollView zoomToRect:userPicture.frame animated:YES];
        }
        else if(shareBothimagesSwitch.on == NO){
            
            /////////iPhone Detection settings
            if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
                if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
                    CGSize result = [[UIScreen mainScreen] bounds].size;
                    CGFloat scale = [UIScreen mainScreen].scale;
                    result = CGSizeMake(result.width * scale, result.height * scale);
                    
                    if(result.height == 960 || result.height == 480) {//480 iPad mini 1
                        //NSLog(@"iPhone 4 Resolution");
                        
                        //userPicture.frame = CGRectMake(0, 0, 320, 568);
                        userPicScrollView.frame = CGRectMake(0, 0, 320, 480);
                        [UIView beginAnimations:Nil context:NULL];
                        [UIView setAnimationDuration:0.5];
                        //userPicture.frame = CGRectMake(0, 0, 160, 284);
                        userPicScrollView.frame = CGRectMake(80, 0, 160, 240);
                        
                        [UIView commitAnimations];
                        
                    }
                    if(result.height == 1136) {
                        //NSLog(@"iPhone 5 Resolution");
                        
                        //userPicture.frame = CGRectMake(0, 0, 320, 568);
                        userPicScrollView.frame = CGRectMake(0, 0, 320, 568);
                        [UIView beginAnimations:Nil context:NULL];
                        [UIView setAnimationDuration:0.5];
                        //userPicture.frame = CGRectMake(0, 0, 160, 284);
                        userPicScrollView.frame = CGRectMake(80, 0, 160, 284);
                        
                        [UIView commitAnimations];
                    }
                }
            }
            /////////iPhone Detection settings
            
            
           
            
            userPicture.contentMode = UIViewContentModeScaleToFill;
            [userPicScrollView zoomToRect:userPicture.frame animated:YES];
        }
    }
   
 
    zoomInImageBtn.hidden = NO;
}
//Enabling Pinch-Zoom for User Reaction Image (iPhone Only)
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return userPicture;
}







///Timers And Camera Shot Code

//launching the view to flip the images
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

//flipping the images
-(void)flipImageCount{
    
    
    
    //[self tempCamCode];
    flipImageDouble += 0.5;
    
    
    tempDouble = randomAmountCute - flipImageDouble;
    
    randomCute = [self getRandomNumberBetweenMin:1 andMax:89];
    if(tempDouble >= 2 && tempDouble <= 9){
        if(tempDouble == 2){
            
        shootTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(shootPic) userInfo:nil repeats:YES];
            
        //    userReactionSoloPrintScreenImageView.image = [UIImage imageNamed:@"DELETE.JPG"];
        //   userReactionPrintScreenImage.image = [UIImage imageNamed:@"DELETE.JPG"];
         //   userPicture.image = [UIImage imageNamed:@"DELETE.JPG"];
        }
        
        if ([chosen_numbers indexOfObject:[NSNumber numberWithInt:randomCute]]!=NSNotFound){
            randomCute = [self getRandomNumberBetweenMin:1 andMax:89];
            
           // NSLog(@"!=: %i, a: %@", randomCute, chosen_numbers);
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
        //NSLog(@"else: %i, a: %@", randomCute, chosen_numbers);
        
        
      
      
    }
   
    
    
    
    
    
    if( tempDouble == 1 ){
        
        
        
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
            
           // NSLog(@"show disgusting number: %i", randomDiscusting);
            
        }
        
      
        
    }
    
  
    
    //pull up the user share view and invalidate all timers
    if( tempDouble == 0.00){
        
        mainImage.hidden = YES;
        userReactionShareView.hidden = NO;
        
        
        /////////iPhone Detection settings
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
            if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
                CGSize result = [[UIScreen mainScreen] bounds].size;
                CGFloat scale = [UIScreen mainScreen].scale;
                result = CGSizeMake(result.width * scale, result.height * scale);
                
                if(result.height == 960 || result.height == 480) {//480 iPad mini 1
                    //NSLog(@"iPhone 4 Resolution");
                    
                    userPicScrollView.frame = CGRectMake(0, 0, 320, 480);
                    userPicture.frame = CGRectMake(0, 0, 320, 480);
                    [UIView beginAnimations:nil context:NULL];
                    [UIView setAnimationDuration:0.5];
                    userPicScrollView.frame = CGRectMake(0, 0, 160, 240);
                    userPicture.frame = CGRectMake(0, 0, 160, 240);
                    [UIView commitAnimations];
                 
                }
                if(result.height == 1136) {
                    //NSLog(@"iPhone 5 Resolution");
                    
                    userPicScrollView.frame = CGRectMake(0, 0, 320, 568);
                    userPicture.frame = CGRectMake(0, 0, 320, 568);
                    [UIView beginAnimations:nil context:NULL];
                    [UIView setAnimationDuration:0.5];
                    userPicScrollView.frame = CGRectMake(0, 0, 160, 284);
                    userPicture.frame = CGRectMake(0, 0, 160, 284);
                    [UIView commitAnimations];
                }
            }
        }
        /////////iPhone Detection settings
        
        
    
        
        [flipImageTimer invalidate];
        
        mainImagePrintScreenImage.contentMode = UIViewContentModeScaleAspectFit;
        userPicture.contentMode = UIViewContentModeScaleAspectFit;
        userReactionPrintScreenImage.contentMode = UIViewContentModeScaleAspectFit;
        userReactionSoloPrintScreenImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        if([uploadViewString isEqualToString:@"uploadedViewRandom"] || [uploadViewString isEqualToString:@"uploadedView"] ){
            [self cameraRollReaction:nil];
        }
        
    }
    //  NSLog(@"tempD %f = ranAmtCute %i - flipImage: %f ", tempDouble, randomAmountCute, flipImageDouble);
    NSLog(@"%f", tempDouble);
}

///get randdom number
-(int) getRandomNumberBetweenMin:(int)min andMax:(int)max//sets random number min and max numbers
{
    return ( (arc4random() % (max-min+1)) + min );
}




- (void)viewDidLoad
{
    if([uploadViewString isEqualToString:@"uploadedViewRandom"] || [uploadViewString isEqualToString:@"uploadedView"]){
        showMoreButton.hidden = YES;
        moreIcon.hidden = YES;
    }
    else {
        showMoreButton.hidden = NO;
        moreIcon.hidden = NO;
    }
    
    mainImage.contentMode = UIViewContentModeScaleAspectFit;
    userPicture.contentMode = UIViewContentModeScaleAspectFit;
    userReactionPrintScreenImage.contentMode = UIViewContentModeScaleAspectFit;
    userReactionSoloPrintScreenImageView.contentMode = UIViewContentModeScaleAspectFit;
   
  

    self.image = pleaseHoldWallpaper.image;
    UIImage *effectImage = nil;
    effectImage = [self.image applyLightEffect];
    self.pleaseHoldWallpaper.image = effectImage;
    self.viewWallpaper.image = effectImage;
    
    viewWallpaper.alpha = 0.7;
    
    
    if([nameString length] != 0){
        yourReactionScreenShotLabel.text = [NSString stringWithFormat:@"< %@'s Reaction", nameString];
    }
  
    

    
    //enable motion movement
    UIInterpolatingMotionEffect *xAxis = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    xAxis.minimumRelativeValue = [NSNumber numberWithFloat:-12.0];
    xAxis.maximumRelativeValue = [NSNumber numberWithFloat:+12.0];
    
    UIInterpolatingMotionEffect *yAxis = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    yAxis.minimumRelativeValue = [NSNumber numberWithFloat:-12.0];
    yAxis.maximumRelativeValue = [NSNumber numberWithFloat:+12.0];
    
    
    UIMotionEffectGroup *group = [[UIMotionEffectGroup alloc] init];
    group.motionEffects = @[xAxis, yAxis];
    [userReactionShareView addMotionEffect:group];
    
    chosen_numbers = [[NSMutableArray alloc] initWithObjects: nil];
    //turn switch on
    shareBothimagesSwitch.on = YES;
    
    //selecting the amount of random images to show before the camera takes shot on the discusting one
    randomAmountCute = [self getRandomNumberBetweenMin:3 andMax:7];/// 3-7
    
    //selecting the images
    randomCute = [self getRandomNumberBetweenMin:1 andMax:89];
    
    NSString *imageSelString = [NSString stringWithFormat:@"c%i.jpg", randomCute];
    
    
    [mainImage setImage:[UIImage imageNamed:imageSelString]];
    
    
    ////
    userReactionShareView.hidden = YES;
    countDownView.hidden = YES;
    
    
    countDownView.hidden = NO;
    countDownInt = 2;
    
    shootFloat = 0.00;
    
    mainImage.hidden = YES;
    
    
    
    countDownTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    ////////////////////////
    ////activate zoom in/out
    float minimumScale = [userPicScrollView frame].size.width  / [userPicScrollView frame].size.width;
    
    userPicScrollView.contentSize = [userPicScrollView frame].size;
    userPicScrollView.maximumZoomScale = 4.0;
    userPicScrollView.minimumZoomScale = minimumScale;
    
    userPicScrollView.zoomScale = userPicScrollView.minimumZoomScale;
    
    userPicScrollView.delegate = self;
    /////
    //////////activate zoom in/out
    
    UITapGestureRecognizer *gestureRecognizer =
    [[UITapGestureRecognizer alloc]
     initWithTarget:self
     action:@selector(fingerTouchZoomOut)];
    [self.userReactionShareView addGestureRecognizer:gestureRecognizer];
    

    
    userReactionPrintScreenImage.transform = CGAffineTransformMakeRotation(M_PI * +0.1);
    mainImagePrintScreenImage.transform = CGAffineTransformMakeRotation(M_PI * -0.1);
    
   
    /////////iPhone Detection settings
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
            CGSize result = [[UIScreen mainScreen] bounds].size;
            CGFloat scale = [UIScreen mainScreen].scale;
            result = CGSizeMake(result.width * scale, result.height * scale);
            
            if(result.height == 960 || result.height == 480) {//480 iPad mini 1
                //NSLog(@"iPhone 4 Resolution");
                
                countDownReactionView.frame = CGRectMake(0, 0, 320, 480);
                countDownView.frame = CGRectMake(0, 0, 320, 480);
                userReactionShareView.frame = CGRectMake(0, 0, 320, 480);
                printScreenView.frame = CGRectMake(0, 0, 320, 480);
                mainImage.frame = CGRectMake(0, 0, 320, 480);
                
                
                //print screen
                userReactionSoloPrintScreenImageView.frame = CGRectMake(1, 7, 160, 240);
                mainImagePrintScreenImage.frame = CGRectMake(157, 250, 160, 240);
                userReactionSoloPrintScreenImageView.frame = CGRectMake(40, 71, 240, 360);
                
                //reaction view
                secondMainImage.frame = CGRectMake(160, 0, 160, 240);
                iconPrintScreenWallpaper.frame = CGRectMake(0, 0, 320, 480);
                iconMainWallpaper.frame = CGRectMake(0, 0, 320, 480);
                
                //buttonsView.frame = CGRectMake(0, 257, 320, 210);
                developerScreenShotLabel.frame = CGRectMake(5, 447, 320, 33);
                
                pleaseHoldWallpaper.frame = CGRectMake(0, 0, 320, 480);
                pleaseHoldLabel.frame = CGRectMake(0, 0, 320, 480);
                
                buttonsView.frame = CGRectMake(0, 248, 320, 240);
            }
            if(result.height == 1136) {
                //NSLog(@"iPhone 5 Resolution");
                
                
            }
        }
    }
    /////////iPhone Detection settings
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)shootPic{
    shootFloat += 0.1;
    
    if(shootFloat >= 1.0){
       
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
                    
                 
                
                  //sleep to take clearer pic
                        sleep(1);
                        
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
                        shootFloat = 0.00;
                        [shootTimer invalidate];
                   
                }
            }
        }
    }
    
    
 
    
}

-(void)dealloc{
    self.nameString = nil;
    self.uploadViewString = nil;
    self.img = nil;
    self.viewWallpaper = nil;
    self.countDownView = nil;
    self.mainImage = nil;
    self.userReactionShareView = nil;
    self.userPicture = nil;
    self.secondMainImage = nil;
    self.moreIcon = nil;
   // self.picZoomInBtn = nil;
    self.userPicScrollView = nil;
    self.zoomInImageBtn = nil;
    self.shareBothimagesSwitch = nil;
    self.yourReactionScreenShotLabel = nil;
    self.mainImageScreenShotLabel = nil;
    self.developerScreenShotLabel = nil;
    self.printScreenView = nil;
    self.userReactionPrintScreenImage = nil;
    self.mainImagePrintScreenImage = nil;
    self.userReactionSoloPrintScreenImageView = nil;
    
   // self.cameraRollBtn = nil;
   // self.mailBtn = nil;
   // self.fbBtn = nil;
    
    self.iPhoneView = nil;
    
   // self.goBackButton = nil;
    
    self.showMoreButton = nil;
    self.pleaseHoldLabel = nil;
    self.iconMainWallpaper = nil;
    self.iconPrintScreenWallpaper = nil;
    self.buttonsView = nil;
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