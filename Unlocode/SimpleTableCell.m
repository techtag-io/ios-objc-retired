//
//  SimpleTableCell.m
//  Unlocode
//
//  Created by SpidrWeb on 3/25/13.
//  Copyright (c) 2013 BrainGears Software. All rights reserved.
//

#import "SimpleTableCell.h"

@implementation SimpleTableCell
@synthesize nameLabel = _nameLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
