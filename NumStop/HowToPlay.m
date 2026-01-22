//
//  HowToPlay.m
//  NumStop
//
//  Created by Travis McGowan on 6/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HowToPlay.h"

@interface HowToPlay ()

@end

@implementation HowToPlay
@synthesize screenShot, description, levelTitle;




-(IBAction)back:(id)sender{
    if([levelTitle.text isEqualToString:@"Level 25!"]){
        levelTitle.text = @"Dual Number Flip";
        description.text = @"Now the fun really begins, It's called a FLIP for a reason. The random numbers are flipped, the incrementing numbers, the buttons are flipped or maybe 2 of the 3 are flipped! You might have to tap button one to stop number 2 on random numer 2, you might have to tap button 2 to stop number 1 on random number 2, or you might have to tap button 2 to stop number 2 for random number 1,,, and of curse all vise versa... with only that difference the same Dual Number rules apply only now you have an extra button on the side, tap the button and you can see directional arrows, these are great help to show you what button must be tapped to stop what incrementing number for which random number, but we careful, because even tho you know how its going to work, it's that much more difficult!";
    }
   else if([levelTitle.text isEqualToString:@"Dual Number"]){
        levelTitle.text = @"Single Number";
       description.text = @"You start off by getting a random number generated for you, shown at the top of the screen. Once you Tap the button, the bottom number will start incrementing. Tap the button again and the incrementing number will stop. Your goal is to stop the Incrementing number to match the Random number. If you the incrementing number skips the random number you will see a timer that will count down 3 seconds to start the incrementation over. Once the incrementation starts over, you will have completed one loop without successfully stopping the number. If you pass 10 loops the number will automatically stop and it will count as 1 try. If you do stop the incrementing number and it does not match the random number, that will count as one try. To get the perfect game get all scores as 1st Try and 1st Loop!";
    }
    else if([levelTitle.text isEqualToString:@"Dual Number Flip"]){
        levelTitle.text = @"Dual Number";
        description.text = @"With the same rules as Single number, your goal is to match the incrementing number to the random number, only now you have 2 numbers to match! Two numbers are generated and at the tap of the button you will get 2 buttons to stop the two numbers, both numbers will be incrementing at different speeds to make it a little more challenging. Here is the twist! If you tap either of the stop buttons and you fail, you have a second chance to redeem it, If the second number is correct than the failed number will immediately automatically start the incrementation again, but with a different random number, if you manage to pass it, it will count as the same try as if you never failed the first time, but be careful because you only get 3 loops on this second chance!";
    }
    else if([levelTitle.text isEqualToString:@"Single Number"]){
        levelTitle.text = @"Level 25!";
        description.text = @"In my opnion the hardest level of all! Yes you only get 1 number, however you get 3 Random numbers and only 1 chance! Once you tap the button the incrementation will start, you MUST stop it on the precise number to continue, if you fail you have to start over! Once you get the first number the incrementing number will continue without stopping, but the random number will change to a higner number and the incrementing speed will increase. Once again, only one chance! if you fail, you must start over, so stop the number precisely and one final number will appear, again the speed will increase without stopping the incrementation. There are no loops, you can get one tap per number, pass it or fail it!";
    }
    
}
-(IBAction)next:(id)sender{
    if([levelTitle.text isEqualToString:@"Single Number"]){
       levelTitle.text = @"Dual Number";
        description.text = @"With the same rules as Single number, your goal is to match the incrementing number to the random number, only now you have 2 numbers to match! Two numbers are generated and at the tap of the button you will get 2 buttons to stop the two numbers, both numbers will be incrementing at different speeds to make it a little more challenging. Here is the twist! If you tap either of the stop buttons and you fail, you have a second chance to redeem it, If the second number is correct than the failed number will immediately automatically start the incrementation again, but with a different random number, if you manage to pass it, it will count as the same try as if you never failed the first time, but be careful because you only get 3 loops on this second chance!";
    }
    else if([levelTitle.text isEqualToString:@"Dual Number"]){
        levelTitle.text = @"Dual Number Flip";
             description.text = @"Now the fun really begins, It's called a FLIP for a reason. The random numbers are flipped, the incrementing numbers, the buttons are flipped or maybe 2 of the 3 are flipped! You might have to tap button one to stop number 2 on random numer 2, you might have to tap button 2 to stop number 1 on random number 2, or you might have to tap button 2 to stop number 2 for random number 1,,, and of curse all vise versa... with only that difference the same Dual Number rules apply only now you have an extra button on the side, tap the button and you can see directional arrows, these are great help to show you what button must be tapped to stop what incrementing number for which random number, but we careful, because even tho you know how its going to work, it's that much more difficult!";
    }

    else if([levelTitle.text isEqualToString:@"Dual Number Flip"]){
        levelTitle.text = @"Level 25!";
        description.text = @"In my opnion the hardest level of all! Yes you only get 1 number, however you get 3 Random numbers and only 1 chance! Once you tap the button the incrementation will start, you MUST stop it on the precise number to continue, if you fail you have to start over! Once you get the first number the incrementing number will continue without stopping, but the random number will change to a higner number and the incrementing speed will increase. Once again, only one chance! if you fail, you must start over, so stop the number precisely and one final number will appear, again the speed will increase without stopping the incrementation. There are no loops, you can get one tap per number, pass it or fail it!";
    }
    else if([levelTitle.text isEqualToString:@"Level 25!"]){
        levelTitle.text = @"Single Number";
        description.text = @"You start off by getting a random number generated for you, shown at the top of the screen. Once you Tap the button, the bottom number will start incrementing. Tap the button again and the incrementing number will stop. Your goal is to stop the Incrementing number to match the Random number. If you the incrementing number skips the random number you will see a timer that will count down 3 seconds to start the incrementation over. Once the incrementation starts over, you will have completed one loop without successfully stopping the number. If you pass 10 loops the number will automatically stop and it will count as 1 try. If you do stop the incrementing number and it does not match the random number, that will count as one try. To get the perfect game get all scores as 1st Try and 1st Loop!";
    }
}
-(IBAction)mainMenu:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
