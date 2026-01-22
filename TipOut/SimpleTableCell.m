//
//  SimpleTableCell.m
//  TipOut
//
//  Created by SpidrWeb on 7/22/15.
//  Copyright (c) 2015 BrainGears-Software. All rights reserved.
//

#import "SimpleTableCell.h"

@implementation SimpleTableCell
@synthesize tipLabel = _tipLabel, dateLabel = _dateLabel;



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
if (self) {
// Initialization code
    NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
    self = [nibArray objectAtIndex:0];
    
}
return self;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
