//
//  HowToPlay.h
//  NumStop
//
//  Created by Travis McGowan on 6/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HowToPlay : UIViewController{
    UIImageView *screenShot;
    UITextView *description;
    UILabel *levelTitle;
}
@property (nonatomic, retain) IBOutlet UILabel *levelTitle;
@property (nonatomic, retain) IBOutlet UIImageView *screenShot;
@property (nonatomic, retain) IBOutlet UITextView *description;

-(IBAction)back:(id)sender;
-(IBAction)next:(id)sender;
-(IBAction)mainMenu:(id)sender;
@end
